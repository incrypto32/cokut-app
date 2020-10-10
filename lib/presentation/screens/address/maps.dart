import 'package:cokut/cubit/address_picker/address_cubit.dart';
import 'package:cokut/presentation/widgets/components/boxes/map_box.dart';
import 'package:cokut/presentation/widgets/forms/addressform2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Map<String, LatLng> location = {};

  @override
  Widget build(BuildContext context) {
    AddressCubit addressCubit = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
      body: BlocProvider<AddressCubit>.value(
        value: addressCubit,
        child: Column(
          children: [
            Flexible(
              child: MapBox(
                location: location,
                addressCubit: addressCubit,
              ),
            ),
            Address2Form(),
          ],
        ),
      ),
    );
  }
}
