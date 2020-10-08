import 'dart:async';

import 'package:cokut/cubit/address_picker/address_cubit.dart';
import 'package:cokut/models/user.dart';
import 'package:cokut/presentation/widgets/animation/fade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  void _onCameraIdle(BuildContext context) async {
    if (location["address"] != null) {
      print(location["address"]);
      await placemarkFromCoordinates(
        location["address"].latitude,
        location["address"].longitude,
      ).then(
        (value) {
          context.bloc<AddressCubit>().selectPlace(
                PlaceInfo.fromPlacemarkAndCoordinates(
                  value[0],
                  location["address"],
                ),
              );
        },
      );
    }
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
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    compassEnabled: false,
                    onCameraMove: (position) async {
                      location["address"] = position.target;
                    },
                    onCameraIdle: () {
                      _onCameraIdle(context);
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
