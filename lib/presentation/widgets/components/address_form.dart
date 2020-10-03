import 'dart:ui';

import 'package:cokut/models/user.dart';
import 'package:cokut/presentation/widgets/components/micro/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddressForm extends StatefulWidget {
  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Address _address;

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
            ),
            CustomTextFormField(
              borderRadius: 5,
              hintText: "House No / Flat No / House Name",
              padding: EdgeInsets.symmetric(vertical: 5),
              onChanged: (val) => _address.adl1 = val,
            ),
            CustomTextFormField(
              borderRadius: 5,
              hintText: "Street / Lane ",
              padding: EdgeInsets.symmetric(vertical: 5),
              onChanged: (val) => _address.adl2 = val,
            ),
            CustomTextFormField(
              borderRadius: 5,
              hintText: "Landmark",
              padding: EdgeInsets.symmetric(vertical: 5),
              onChanged: (val) => _address.adl3 = val,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: DropdownButtonFormField(
                onSaved: (newValue) => _address.zone,
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
                onChanged: (val) {},
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: FlatButton(
                padding: EdgeInsets.all(0),
                color: Colors.green,
                onPressed: () {},
                child: Text(
                  "Add Address",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
