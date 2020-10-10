import 'package:cokut/cubit/address_picker/address_cubit.dart';
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
              onChanged: (val) => _address.title = val,
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
              onChanged: (val) => _address.adl2 = val,
              validator: validator,
              enableBorder: false,
            ),
            Container(
              child: BlocConsumer<AddressCubit, AddressState>(
                listener: (context, state) {
                  if (state is AddressDataChange) Navigator.of(context).pop();
                },
                builder: (context, state) => FlatButton(
                  color: Colors.green,
                  onPressed: (state is AddressDataLoading)
                      ? () {}
                      : () {
                          addressCubit.addAddress(context, _address, _formKey);
                        },
                  child: ((state is AddressDataLoading))
                      ? Container(
                          alignment: Alignment.center,
                          width: 200,
                          child: SpinKitThreeBounce(
                            size: 20,
                            color: Colors.white,
                          ),
                        )
                      : Container(
                          width: 200,
                          alignment: Alignment.center,
                          child: Text(
                            "Add Address",
                            style: TextStyle(color: Colors.white),
                          ),
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
