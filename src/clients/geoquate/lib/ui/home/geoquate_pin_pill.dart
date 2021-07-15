import 'package:geoquate/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class MapPinPillComponent extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return AnimatedOpacity(
      // If the widget is visible, animate to 0.0 (invisible).
      // If the widget is hidden, animate to 1.0 (fully visible).
      opacity: viewModel.currentlySelectedPin.locationName != '' ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      // The green box must be a child of the AnimatedOpacity widget.
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.all(20),
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    blurRadius: 20,
                    offset: Offset.zero,
                    color: Colors.grey.withOpacity(0.5))
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(left: 10),
                child: ClipOval(
                    child: Image.asset(
                        viewModel.currentlySelectedPin.avatarPath ??
                            "assets/custom-pin.png",
                        fit: BoxFit.cover)),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(viewModel.currentlySelectedPin.locationName,
                          style: TextStyle(
                              color: HexColor.fromHex(
                                  viewModel.currentlySelectedPin.labelColor ??
                                      ""))),
                      Text(
                          'Latitude: ${viewModel.currentlySelectedPin.lat.toString()}',
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text(
                          'Longitude: ${viewModel.currentlySelectedPin.long.toString()}',
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Image.asset(
                    viewModel.currentlySelectedPin.pinPath ??
                        "assets/custom-pin.png",
                    width: 50,
                    height: 50),
              )
            ],
          ),
        ),
      ),
    );
  }
}
