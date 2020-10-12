import 'package:cokut/cubit/address_picker/address_cubit.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/user_repo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen();
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    //
    //
    var addressCubit = AddressCubit(
      authenticationRepository: context.repository<AuthenticationRepository>(),
      userRepository: context.repository<UserRepository>(),
    );
    var userRepository = context.repository<UserRepository>();
    //
    //
    return BlocProvider<AddressCubit>(
      create: (context) => addressCubit,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconTheme.of(context).copyWith(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            "Addresses",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) => (state is AddressDataLoading)
              ? Center(
                  child: SpinKitCircle(
                    size: 35,
                    color: Colors.green,
                  ),
                )
              : ListView(
                  shrinkWrap: true,
                  children: userRepository.addressList.map(
                    (e) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        child: Card(
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    e.title ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Text(
                                  "${e.adl1}, ${e.adl2},",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  "${e.placeInfo.details}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontWeight: FontWeight.normal),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FlatButton(
                                      padding: EdgeInsets.all(0),
                                      textColor: Colors.green,
                                      onPressed: () {},
                                      child: Text("EDIT"),
                                    ),
                                    FlatButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: () {
                                        addressCubit.deleteAddress(e);
                                      },
                                      textColor: Colors.red,
                                      child: Text("DELETE"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/maps', arguments: addressCubit);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
