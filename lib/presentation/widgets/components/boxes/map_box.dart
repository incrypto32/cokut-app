import 'dart:async';

import 'package:cokut/presentation/widgets/animation/fade.dart';
import 'package:cokut/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapBox extends StatelessWidget {
  MapBox({
    Key key,
    @required this.location,
  });
  final Completer<GoogleMapController> _controller = Completer();
  final Map<String, LatLng> location;

  void _toMyLocation() async {
    final GoogleMapController controller = await _controller.future;

    Position position = await getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    var camPos = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 16,
    );

    controller.animateCamera(CameraUpdate.newCameraPosition(camPos));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CameraPosition>(
      future: () async {
        Position position = await getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
        );
        return CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 15,
        );
      }(),
      builder: (context, snapshot) => snapshot.hasData
          ? FadeTransitionWidget(
              child: Stack(
                children: [
                  GoogleMap(
                    padding: EdgeInsets.all(30),
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: true,
                    onCameraMove: (position) async {
                      location["address"] = position.target;
                    },
                    onCameraIdle: () async {
                      try {
                        if (location["address"] != null) {
                          await placemarkFromCoordinates(
                                  location["address"].latitude,
                                  location["address"].longitude)
                              .then((value) {
                            print(value[1].toJson());
                          });
                        }
                      } catch (e) {
                        logger.e("PANI 1");
                      }
                    },
                    mapType: MapType.normal,
                    initialCameraPosition: snapshot.data,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.green,
                        size: 40,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: IconButton(
                        icon: Icon(Icons.my_location),
                        padding: EdgeInsets.all(20),
                        onPressed: _toMyLocation,
                      ),
                    ),
                  )
                ],
              ),
            )
          : Center(
              child: SpinKitRing(
                size: 60,
                color: Colors.blueAccent,
              ),
            ),
    );
  }
}
