import 'package:cokut/cubit/address_picker/address_cubit.dart';
import 'package:cokut/cubit/user_data/user_data_cubit.dart';
import 'package:cokut/infrastructure/repositories/user_repo.dart';
import 'package:cokut/models/user.dart';
import 'package:cokut/presentation/widgets/components/micro/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Address2Form extends StatefulWidget {
  Address2Form();
  @override
  _Address2FormState createState() => _Address2FormState();
}

class _Address2FormState extends State<Address2Form> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Address _address = Address();
  String Function(String) validator = (val) {
    return val == "" || val == null ? "Please fill the field" : null;
  };

  @override
  Widget build(BuildContext context) {
    var addressCubit = context.bloc<AddressCubit>();
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.green,
                    size: 35,
                  ),
                  Flexible(
                    child: BlocBuilder<AddressCubit, AddressState>(
                        builder: (context, state) {
                      var userRepo = context.repository<UserRepository>();
                      var place = userRepo.selectedPlace;
                      return place != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  place.name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  place.details,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )
                          : Container(
                              child: Text(
                                "LOADING..",
                                style: TextStyle(fontSize: 25),
                              ),
                            );
                    }),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.blueAccent,
            ),
            CustomTextFormField(
              borderRadius: 5,
              hintText: "Title  eg: Home, Hostel, Moms place, College",
              padding: EdgeInsets.symmetric(vertical: 5),
              onChanged: (val) => _address.adl3 = val,
              validator: validator,
              enableBorder: false,
            ),
            CustomTextFormField(
              borderRadius: 5,
              hintText: "House No / Flat No / House Name",
              padding: EdgeInsets.symmetric(vertical: 5),
              onChanged: (val) => _address.adl1 = val,
              validator: validator,
              enableBorder: false,
            ),
            CustomTextFormField(
              borderRadius: 5,
              hintText: "Landmark",
              padding: EdgeInsets.symmetric(vertical: 5),
              onChanged: (val) => _address.adl3 = val,
              validator: validator,
              enableBorder: false,
            ),
            Container(
              child: BlocBuilder<AddressCubit, AddressState>(
                builder: (context, state) => FlatButton(
                  color: Colors.green,
                  onPressed: (state is AddressLoading)
                      ? () {}
                      : () {
                          if (_formKey.currentState.validate()) {
                            context.bloc<UserDataCubit>().addAddress(_address);
                          }
                        },
                  child: (state is AddressLoading)
                      ? SpinKitThreeBounce(
                          size: 20,
                          color: Colors.white,
                        )
                      : Text(
                          "Add Address",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
