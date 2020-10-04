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
                    context.repository<UserRepository>().user.address.map((e) {
                  print(e.adl1);
                  return ListTile(
                    title: Text(e.title ?? "NULL"),
                    subtitle: Text(e.adl1),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          context.bloc<UserDataCubit>().deleteAddress(e);
                        }),
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
