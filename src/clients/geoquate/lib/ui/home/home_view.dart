import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

import 'geoquate_pin_pill.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: const Text('GeoQuate Events'),
                actions: <Widget>[
                  IconButton(
                    onPressed: () => model.showHome(),
                    icon: Icon(Icons.home),
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Card(
                          elevation: 4,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width - 30,
                              height:
                                  MediaQuery.of(context).size.height * (1 / 2),
                              child: GoogleMap(
                                myLocationEnabled: true,
                                compassEnabled: true,
                                mapToolbarEnabled: false,
                                tiltGesturesEnabled: true,
                                zoomGesturesEnabled: true,
                                markers: model.markers.toSet(),
                                mapType: MapType.normal,
                                initialCameraPosition: const CameraPosition(
                                  target: LatLng(40.714990, -84.189410),
                                  zoom: 15.0,
                                ),
                                onMapCreated: model.onMapCreated,
                                onTap: (LatLng location) {
                                  model.pinPillPosition = -100;
                                },
                              )),
                        ),
                      ),
                      MapPinPillComponent(),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 8.0),
                      //   child: Slider(
                      //     min: 1,
                      //     max: 200,
                      //     divisions: 4,
                      //     value: 40.0,
                      //     label: '',
                      //     activeColor: Colors.blue,
                      //     inactiveColor: Colors.blue.withOpacity(0.2),
                      //     onChanged: (double value) =>
                      //         model.sliderChanged(value),
                      //   ),
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: <Widget>[
                      //     Container(
                      //       width: 100,
                      //       child: TextField(
                      //         controller: model.latitudeController,
                      //         keyboardType: TextInputType.number,
                      //         textInputAction: TextInputAction.next,
                      //         decoration: InputDecoration(
                      //             labelText: 'lat',
                      //             border: OutlineInputBorder(
                      //               borderRadius: BorderRadius.circular(8),
                      //             )),
                      //       ),
                      //     ),
                      //     Container(
                      //       width: 100,
                      //       child: TextField(
                      //         controller: model.longitudeController,
                      //         keyboardType: TextInputType.number,
                      //         decoration: InputDecoration(
                      //             labelText: 'lng',
                      //             border: OutlineInputBorder(
                      //               borderRadius: BorderRadius.circular(8),
                      //             )),
                      //       ),
                      //     ),
                      //     MaterialButton(
                      //       color: Colors.blue,
                      //       onPressed: () {
                      //         double lat =
                      //             double.parse(model.latitudeController.text);
                      //         double lng =
                      //             double.parse(model.longitudeController.text);
                      //         model.addPoint(lat, lng);
                      //       },
                      //       child: Text(
                      //         'ADD',
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      // MaterialButton(
                      //   color: Colors.amber,
                      //   child: Text(
                      //     'Add nested ',
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      //   onPressed: () {
                      //     double lat =
                      //         double.parse(model.latitudeController.text);
                      //     double lng =
                      //         double.parse(model.longitudeController.text);
                      //     model.addNestedPoint(lat, lng);
                      //   },
                      // ),
                      // MaterialButton(
                      //   color: Colors.blueGrey,
                      //   child: Text(
                      //     'Stream Test ',
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      //   onPressed: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => Scaffold()),
                      //     );
                      //   },
                      // )
                    ],
                  ),
                ),
              ),
            ));
  }
}
