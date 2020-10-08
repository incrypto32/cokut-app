import 'package:cokut/cubit/order/order_cubit.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:cokut/infrastructure/repositories/restaurant_repo.dart';
import 'package:cokut/infrastructure/repositories/user_repo.dart';
import 'package:cokut/models/user.dart';
import 'package:cokut/presentation/screens/scrollablesheettest.dart';
import 'package:cokut/presentation/widgets/animation/fade.dart';
import 'package:cokut/presentation/widgets/components/order_tile.dart';
import 'package:cokut/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  const Settings();
  @override
  Widget build(BuildContext context) {
    var user = context.repository<UserRepository>().user ??
        User(name: "Name", email: "email", phone: "Phone");

    return FadeTransitionWidget(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.green,
                  size: 60,
                ),
                title: Text(
                  user.name ?? "Name",
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: Text(user.email ?? "mail"),
                trailing: IconButton(
                  onPressed: () {
                    context.repository<AuthenticationRepository>().logOut();
                  },
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                ),
              ),
              buildSettingsItemTile(context, "Address", Icons.home,
                  route: '/address'),
              // buildSettingsItemTile("Payments", Icons.payment),
              // buildSettingsItemTile("Orders", Icons.event_note, onTap: () {
              //   Navigator.of(context).pushNamed('/orders');
              // }),
              // buildSettingsItemTile("Refferals", Icons.card_giftcard),
              // buildSettingsItemTile("Settings", Icons.settings),
              // Container(
              //   color: Colors.grey[100],
              //   height: 30,
              // ),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) => HomePage()));
                  },
                  child: Text("POO")),
              buildSettingsItemTile(
                  context, "Terms of Service", Icons.import_contacts,
                  route: '/maps'),
              buildSettingsItemTile(context, "Rate the app", Icons.star),
              buildSettingsItemTile(context, "About", Icons.subject),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Previous Orders",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              BlocProvider<OrderCubit>(
                create: (context) => OrderCubit(
                  authenticationRepository:
                      context.repository<AuthenticationRepository>(),
                  cartRepository: context.repository<CartRepository>(),
                  userRepository: context.repository<UserRepository>(),
                ),
                child: Builder(builder: (context) {
                  context.bloc<OrderCubit>().getOrders();
                  return BlocConsumer<OrderCubit, OrderState>(
                    listener: (context, state) {
                      if (state is OrdersGetError) {
                        Utils.showWarning(context, content: state.message);
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: context
                            .repository<UserRepository>()
                            .orders
                            .map(
                              (e) => Text(e.address.toString() ?? "NAme"),
                            )
                            .toList(),
                      );
                    },
                  );
                }),
              ),
              OrderTile(
                context
                    .repository<RestaurantRepository>()
                    .restaurants
                    .values
                    .toList()[0],
              ),
              OrderTile(
                context
                    .repository<RestaurantRepository>()
                    .restaurants
                    .values
                    .toList()[2],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildSettingsItemTile(
      BuildContext context, String content, IconData icon,
      {String route}) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      leading: Icon(icon),
      title: Text(
        content,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Icon(Icons.chevron_right),
    );
  }
}
