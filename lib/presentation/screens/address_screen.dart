import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen();
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _form = GlobalKey<FormState>();
  int _state;

  Future<void> saveForm() async {
    final validate = _form.currentState.validate();
    if (!validate) {
      return;
    }
    _form.currentState.save();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address"),
      ),
      body: Center(
        child: Text("Addresses"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buildShowModalBottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  15, 15, 15, MediaQuery.of(context).viewInsets.bottom + 15),
              child: Form(
                key: _form,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: " Name",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[400],
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a Valid Name';
                        }
                        return null;
                      },
                      onSaved: (newValue) {},
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: " Phone Number",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[400],
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a Valid Phone Number';
                        }
                        return null;
                      },
                      onSaved: (newValue) {},
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: " House / Flat Name",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[400],
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a Valid House Name';
                        }
                        return null;
                      },
                      onSaved: (newValue) {},
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: ' Street Name ',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[400],
                        ),
                      ),
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a Valid Street Name';
                        }
                        return null;
                      },
                      onSaved: (newValue) {},
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: ' Town / City',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[400],
                        ),
                      ),
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textInputAction: TextInputAction.next,
                      onSaved: (newValue) {},
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: ' Pincode',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[400],
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textInputAction: TextInputAction.next,
                      onSaved: (newValue) {},
                    ),
                    DropdownButton(
                        hint: Text(
                          "Select State",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[400],
                          ),
                        ),
                        isExpanded: true,
                        value: _state,
                        items: [
                          DropdownMenuItem(child: Text("Kerala"), value: 1),
                          DropdownMenuItem(child: Text("Tamil Nadu"), value: 2),
                        ],
                        onChanged: (v) {
                          setState(() {
                            _state = v;
                          });
                        }),
                    SizedBox(height: 20),
                    RaisedButton(
                      elevation: 0,
                      color: Theme.of(context).accentColor,
                      onPressed: saveForm,
                      child: Container(
                        height: 50,
                        color: Theme.of(context).accentColor,
                        child: Center(
                          child: Text(
                            'Add Address',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
