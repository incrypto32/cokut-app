import 'package:cokut/cubit/user_data/user_data_cubit.dart';
import 'package:cokut/infrastructure/repositories/user_repo.dart';
import 'package:cokut/presentation/widgets/components/address_form.dart';
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconTheme.of(context).copyWith(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Addresses",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<UserDataCubit, UserDataState>(
        buildWhen: (previous, current) => !(current is AddressUpdateError),
        builder: (context, state) => (state is AddressLoading)
            ? Center(
                child: SpinKitCircle(
                  size: 35,
                  color: Colors.green,
                ),
              )
            : ListView(
                shrinkWrap: true,
                children:
                    context.repository<UserRepository>().addressList.map((e) {
                  print(e.adl1);
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
                              padding: const EdgeInsets.symmetric(vertical: 20),
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
                              "${e.adl1}, ${e.adl2}, ${e.adl3}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "zone : ${e.zone}",
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
                                  child: Text("SET AS PRIMARY"),
                                ),
                                FlatButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {},
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
                }).toList(),
              ),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      builder: (BuildContext context) {
        return AddressForm();
      },
    );
  }
}
