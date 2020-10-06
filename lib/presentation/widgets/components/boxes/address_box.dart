import 'package:cokut/cubit/delivery_address/deliveryaddress_cubit.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:cokut/infrastructure/repositories/user_repo.dart';
import 'package:cokut/models/user.dart';
import 'package:cokut/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_select/smart_select.dart';

class AddressBox extends StatelessWidget {
  AddressBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logger.wtf("INSIDE ADDRESS BOX BUILD");
    var _userRepository = context.repository<UserRepository>();
    var _cartRepository = context.repository<CartRepository>();
    var _deliveryAddressCubit =
        DeliveryAddressCubit(_cartRepository, _userRepository);
    return BlocProvider<DeliveryAddressCubit>.value(
      value: _deliveryAddressCubit,
      child: BlocBuilder<DeliveryAddressCubit, DeliveryAddressState>(
        cubit: _deliveryAddressCubit,
        builder: (context, state) {
          logger.d(state);
          List<S2Choice<Address>> options = _userRepository.addressList
              .map((e) => S2Choice<Address>(value: e, title: e.title))
              .toList();

          Address address = _cartRepository.deliveryAddress;

          return (address == null)
              ? AddAddressButton()
              : Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Deliver to",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 20),
                      Text(address.title),
                      Text(
                        address.toString(),
                      ),
                      ButtonBar(
                        children: [
                          ChangeAddressButton(
                            cartRepository: _cartRepository,
                            options: options,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

class ChangeAddressButton extends StatelessWidget {
  const ChangeAddressButton({
    Key key,
    @required CartRepository cartRepository,
    @required this.options,
  })  : _cartRepository = cartRepository,
        super(key: key);

  final CartRepository _cartRepository;
  final List<S2Choice<Address>> options;

  @override
  Widget build(BuildContext context) {
    return SmartSelect<Address>.single(
      tileBuilder: (context, state) => FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: state.showModal,
        child: Text(
          "CHANGE",
          style: TextStyle(color: Colors.green),
        ),
      ),
      title: 'Deliver to',
      modalType: S2ModalType.popupDialog,
      value: _cartRepository.deliveryAddress,
      choiceItems: options,
      onChange: (state) {
        logger.d(state.value);
        context.bloc<DeliveryAddressCubit>().changeDeliveryAddress(state.value);
      },
    );
  }
}

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      color: Colors.white,
      width: double.infinity,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          Navigator.of(context).pushNamed('/address');
        },
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Text("ADD ADDRESS"),
        ),
      ),
    );
  }
}
