import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoquate/app/app.logger.dart';
import 'package:geoquate/app/app.locator.dart';
import 'package:geoquate/constants/color.dart';
import 'package:geoquate/models/application_models.dart';
import 'package:geoquate/services/event_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'dart:async';

// ViewModel
class HomeViewModel extends BaseViewModel {
  String title = 'default';
  final log = getLogger('HomeViewModel');
  final _geoquateService = locator<GeoQuateService>();

  Completer<GoogleMapController> _mapController = Completer();
  TextEditingController _latitudeController = TextEditingController();
  TextEditingController _longitudeController = TextEditingController();
  double _pinPillPosition = -100;
  List<Marker> _markers = [];
  MarkerId? _selectedMarker;

  PinInformation _currentlySelectedPin = PinInformation(
      pinPath: 'assets/custom-pin.png',
      avatarPath: 'assets/custom-pin.png',
      lat: 0,
      long: 0,
      locationName: '',
      labelColor: HexColor.toHex(Colors.grey));

  TextEditingController get latitudeController => _latitudeController;
  TextEditingController get longitudeController => _longitudeController;

  double get pinPillPosition => _pinPillPosition;
  set pinPillPosition(double pinPillPosition) {
    _pinPillPosition = pinPillPosition;
    notifyListeners();
  }

  List<Marker> get markers => _markers;

  MarkerId get selectedMarker => _selectedMarker ?? new MarkerId("default");

  final StreamController<List<DocumentSnapshot<Object?>>> _geoquateController =
      StreamController<List<DocumentSnapshot<Object?>>>.broadcast();

  Stream<List<DocumentSnapshot>> get geoQuate => _geoquateController.stream;

  PinInformation get currentlySelectedPin => _currentlySelectedPin;
  Map<MarkerId, PinInformation> markerInfo = {};

  PinInformation defaultPin = PinInformation(
      pinPath: 'assets/custom-pin.png',
      avatarPath: 'assets/custom-pin.png',
      lat: 0,
      long: 0,
      locationName: '',
      labelColor: HexColor.toHex(Colors.grey));

  int counter = 0;
  void updateTitle() {
    counter++;
    title = '$counter';
    notifyListeners();
  }

  void onMapCreated(GoogleMapController controller) {
    log.v("map created");
    _mapController.complete(controller);
    log.v("searching initial events");
    _geoquateService.searchEvents(40.0);
    _geoquateService.eventStream.listen((events) {
      log.v("event captured $events");
      updateMarkers(events);
    });
  }

  void showHome() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      const CameraPosition(
        target: LatLng(12.960632, 77.641603),
        zoom: 15.0,
      ),
    ));
  }

  void addPoint(double lat, double lng) {
    // GeoFirePoint geoFirePoint = geo.point(latitude: lat, longitude: lng);
    // _firestore
    //     .collection('locations')
    //     .add({'name': 'random name', 'position': geoFirePoint.data}).then((_) {
    //   print('added ${geoFirePoint.hash} successfully');
    // });
    // setState(() {});
  }

  //example to add geoFirePoint inside nested object
  void addNestedPoint(double lat, double lng) {
    // GeoFirePoint geoFirePoint = geo.point(latitude: lat, longitude: lng);
    // _firestore.collection('nestedLocations').add({
    //   'name': 'random name',
    //   'address': {
    //     'location': {'position': geoFirePoint.data}
    //   }
    // }).then((_) {
    //   print('added ${geoFirePoint.hash} successfully');
    // });
  }

  void addMarker(double lat, double lng) {
    final markerIdVal = UniqueKey().toString();
    final MarkerId markerId = MarkerId(markerIdVal);
    var _marker = Marker(
      markerId: MarkerId(markerIdVal),
      position: LatLng(lat, lng),
      onTap: () {
        onMarkerTapped(markerId);
      },
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    );

    markerInfo.putIfAbsent(
        markerId,
        () => new PinInformation(
            locationName: "Start Location",
            lat: lat,
            long: lng,
            pinPath: "assets/custom-pin.png",
            avatarPath: "assets/custom-pin.png",
            labelColor: HexColor.toHex(Colors.blueAccent)));

    markers.add(_marker);
    notifyListeners();
  }

  void onMarkerTapped(MarkerId markerId) {
    final Marker? tappedMarker =
        markers.firstWhere((element) => element.markerId == markerId);
    if (tappedMarker != null) {
      final MarkerId? previousMarkerId = selectedMarker;
      final int oldIndex =
          markers.indexWhere((element) => element.markerId == previousMarkerId);
      final int newIndex =
          markers.indexWhere((element) => element.markerId == markerId);
      if (previousMarkerId != null && oldIndex >= 0) {
        final Marker resetOld = markers[oldIndex].copyWith(
            iconParam: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueViolet,
        ));
        markers[oldIndex] = resetOld;
      }
      if (previousMarkerId != markerId) {
        _selectedMarker = markerId;
        final Marker newMarker = tappedMarker.copyWith(
          iconParam: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        );
        _currentlySelectedPin = markerInfo[markerId] ?? defaultPin;
        markers[newIndex] = newMarker;
      } else {
        _currentlySelectedPin = defaultPin;
        _selectedMarker = new MarkerId("default");
      }
    }
    notifyListeners();
  }

  void updateMarkers(List<DocumentSnapshot> documentList) {
    log.v('updating markers');
    documentList.forEach((DocumentSnapshot document) {
      log.v('document: $document');
      GeoPoint point = document['position']['geopoint'];
      addMarker(point.latitude, point.longitude);
    });
  }

  double _value = 40.0;
  String _label = '';

  sliderChanged(value) {
    _value = value;
    _label = '${_value.toInt().toString()} kms';
    markers.clear();
    _geoquateService.searchEvents(value);
  }
}
