import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:cokut/infrastructure/repositories/restaurant_repo.dart';
import 'package:cokut/infrastructure/repositories/user_repo.dart';
import 'package:cokut/models/user.dart';
import 'package:cokut/presentation/widgets/components/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  const Settings();
  @override
  Widget build(BuildContext context) {
    var user = context.repository<UserRepository>().user ??
        User(name: "Name", email: "email", phone: "Phone");

    return SingleChildScrollView(
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
                  Icons.lock_outline,
                  color: Colors.red,
                ),
              ),
            ),
            buildSettingsItemTile("Address", Icons.home, onTap: () {
              Navigator.of(context).pushNamed('/address');
            }),
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
            buildSettingsItemTile("Terms of Service", Icons.import_contacts),
            buildSettingsItemTile("Rate the app", Icons.star),
            buildSettingsItemTile("About", Icons.subject),
            OrderTile(
              context
                  .repository<RestaurantRepository>()
                  .restaurants[context.repository<CartRepository>().rid],
            ),
            OrderTile(
              context
                  .repository<RestaurantRepository>()
                  .restaurants[context.repository<CartRepository>().rid],
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildSettingsItemTile(String content, IconData icon,
      {Function onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(
        content,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Icon(Icons.chevron_right),
    );
  }
}
