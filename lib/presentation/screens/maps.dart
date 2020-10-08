import 'package:cokut/presentation/widgets/components/boxes/map_box.dart';
import 'package:cokut/presentation/widgets/components/forms/addressform2.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Map<String, LatLng> location = {};

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: [
          Flexible(
            child: MapBox(
              location: location,
            ),
          ),
          Address2Form(),
        ],
      ),
    );
  }
}
