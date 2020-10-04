import 'package:cokut/cubit/user_data/user_data_cubit.dart';
import 'package:cokut/models/user.dart';
import 'package:cokut/presentation/widgets/components/micro/custom_text_form_field.dart';
import 'package:cokut/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AddressForm extends StatefulWidget {
  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Address _address = Address();
  String Function(String) validator = (val) {
    print("_____________________");
    print(val);
    return val == "" || val == null ? "Please fill the field" : null;
  };

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            CustomTextFormField(
              borderRadius: 5,
              hintText: "Title eg: Home ,Office ,Hostel",
              padding: EdgeInsets.symmetric(vertical: 5),
              onChanged: (val) => _address.title = val,
              validator: validator,
            ),
            CustomTextFormField(
              borderRadius: 5,
              hintText: "House No / Flat No / House Name",
              padding: EdgeInsets.symmetric(vertical: 5),
              onChanged: (val) => _address.adl1 = val,
              validator: validator,
            ),
            CustomTextFormField(
              borderRadius: 5,
              hintText: "Street / Lane ",
              padding: EdgeInsets.symmetric(vertical: 5),
              onChanged: (val) => _address.adl2 = val,
              validator: validator,
            ),
            CustomTextFormField(
              borderRadius: 5,
              hintText: "Landmark",
              padding: EdgeInsets.symmetric(vertical: 5),
              onChanged: (val) => _address.adl3 = val,
              validator: validator,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: DropdownButtonFormField(
                onSaved: (newValue) => _address.zone,
                validator: validator,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Zone",
                  hintStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                items: ["1", "2"]
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {
                  _address.zone = val;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: BlocConsumer<UserDataCubit, UserDataState>(
                listener: (context, state) {
                  print(state);
                  if (state is AddressDataChange) {
                    Navigator.of(context).pop();
                  } else if (state is AddressUpdateError) {
                    Utils.showFlushBar(
                      context,
                      "An error occured",
                      icon: Icon(
                        Icons.error_outline,
                        color: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) => FlatButton(
                  padding: EdgeInsets.all(0),
                  color: Colors.green,
                  onPressed: (state is AddressLoading)
                      ? () {}
                      : () {
                          print(_address);
                          if (_formKey.currentState.validate()) {
                            print("hi");
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
