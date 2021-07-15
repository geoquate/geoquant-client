import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoquate/api/firestore_api.dart';
import 'package:geoquate/app/app.locator.dart';
import 'package:geoquate/app/app.logger.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class GeoQuateService {
  final log = getLogger('GeoQuateService');

  final _firestoreApi = locator<FirestoreApi>();

  final StreamController<List<DocumentSnapshot<Object?>>> _geoquateController =
      StreamController<List<DocumentSnapshot<Object?>>>.broadcast();

  final Geoflutterfire geoflutterfire = Geoflutterfire();

  Stream<List<DocumentSnapshot<Object?>>> get eventStream =>
      _geoquateController.stream;

  Future<void> searchEvents(double radius) async {
    GeoFirePoint center =
        geoflutterfire.point(latitude: 40.714990, longitude: -84.189410);

    log.v('Searching events withing $radius miles');

    geoflutterfire
        .collection(collectionRef: _firestoreApi.locationCollection)
        .within(center: center, radius: radius, field: 'position')
        .listen((List<DocumentSnapshot> event) {
      print(event);
      log.v('geoquate event found $event');
      _geoquateController.add(event);
    });
  }
}
