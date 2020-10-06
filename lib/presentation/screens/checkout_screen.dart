import 'package:cokut/cubit/cart/cart_cubit.dart';
import 'package:cokut/cubit/order/order_cubit.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:cokut/presentation/widgets/components/boxes/bill_box.dart';
import 'package:cokut/utils/logger.dart';
import 'package:cokut/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      iconTheme: IconTheme.of(context).copyWith(color: Colors.blueGrey),
      textTheme: Theme.of(context).textTheme,
      centerTitle: true,
      title: Text("Summary"),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
    return BlocProvider(
      create: (context) => OrderCubit(
        context.repository<CartRepository>(),
        context.repository<AuthenticationRepository>(),
      ),
      child: Scaffold(
        appBar: appBar,
        body: BlocConsumer<OrderCubit, OrderState>(
          listener: (context, state) {
            if (state is OrderError) {
              Utils.showWarning(context,
                  content: "Could not place your order please retry");
            }
          },
          builder: (context, state) {
            Widget widget = Text(
              "Proceed",
              style: TextStyle(color: Colors.white),
            );

            Function onPressed = () {
              context.bloc<OrderCubit>().placeOrder(() {
                logger.i("CALLBACK");
                context.bloc<CartCubit>().clearCart();
              });
            };

            if (state is OrderSuccessful) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 100),
                    child: Image.asset(
                      'assets/images/tick.png',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "ORDER SUCCESSFUL",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil(ModalRoute.withName('/'));
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Text("Go Back"),
                    ),
                  )
                ],
              );
            } else if (state is OrderLoading) {
              widget = SpinKitWave(
                size: 15,
                color: Colors.white,
              );
              onPressed = () {};
            }

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 10,
                            child: BillBox(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Payment Methods",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        ListTile(
                          leading: Image.asset('assets/images/cod.png'),
                          title: Text("Cash On Delivery"),
                          subtitle:
                              Text("Pay in cash to our delivery executive"),
                        ),
                        ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/images/hourglass.png'),
                          ),
                          title: Text("Coming Soon"),
                          subtitle: Text(
                              "Stay tuned other payment methods are coming"),
                        ),
                      ],
                    ),
                  ),
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  color: Colors.green,
                  onPressed: onPressed,
                  child: widget,
                ),
                SizedBox(
                  height: 20,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
