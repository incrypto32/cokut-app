import 'dart:async';

import 'package:cokut/cubit/address_picker/address_cubit.dart';
import 'package:cokut/models/user.dart';
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
    @required this.addressCubit,
  });
  final Completer<GoogleMapController> _controller = Completer();
  final Map<String, LatLng> location;
  final AddressCubit addressCubit;

  @override
  Widget build(BuildContext context) {
    void _onCameraIdle() async {
      try {
        if (location["address"] != null) {
          var value = await placemarkFromCoordinates(
            location["address"].latitude,
            location["address"].longitude,
          );

          addressCubit.selectPlace(
            PlaceInfo.fromPlacemarkAndCoordinates(
              value[0],
              location["address"],
            ),
          );
        }
      } catch (e) {
        logger.e(e.toString());
      }
    }

    setMyLocationToCamera() async {
      Position position = await getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      location["address"] = LatLng(
        position.latitude,
        position.longitude,
      );
      _onCameraIdle();
      return CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 15,
      );
    }

    return FutureBuilder<CameraPosition>(
      future: setMyLocationToCamera(),
      builder: (context, snapshot) => snapshot.hasData
          ? FadeTransitionWidget(
              child: Stack(
                children: [
                  GoogleMap(
                    padding: EdgeInsets.all(30),
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    compassEnabled: false,
                    onCameraMove: (position) async {
                      location["address"] = position.target;
                    },
                    onCameraIdle: _onCameraIdle,
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
