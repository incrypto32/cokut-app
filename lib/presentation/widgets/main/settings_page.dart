
import 'package:cokut/infrastructure/auth.dart';
import 'package:cokut/infrastructure/repositories/user_repo.dart';
import 'package:cokut/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  const Settings();
  @override
  Widget build(BuildContext context) {
    var user = context.repository<UserRepository>().user ??
        User(name: "Name", email: "email", phone: "7034320441");
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
                onPressed: authService.signOut,
                icon: Icon(
                  Icons.lock_outline,
                  color: Colors.red,
                ),
              ),
            ),
            buildSettingsItemTile(context,"Address", Icons.home,"address"),
            buildSettingsItemTile(context,"Payments", Icons.payment,"payment"),
            buildSettingsItemTile(context,"Orders", Icons.event_note,"orders"),
            buildSettingsItemTile(context,"Refferals", Icons.card_giftcard,"referrals"),
            buildSettingsItemTile(context,"Settings", Icons.settings,"settings"),
            Container(
              color: Colors.grey[100],
              height: 30,
            ),
            buildSettingsItemTile(context,"Terms of Service", Icons.import_contacts,"terms"),
            buildSettingsItemTile(context,"Rate the app", Icons.star,"rate"),
            buildSettingsItemTile(context,"About", Icons.subject,"about"),
          ],
        ),
      ),
    );
  }

  ListTile buildSettingsItemTile(BuildContext context,String content, IconData icon,String function) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        content,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: (){
        Navigator.of(context).pushNamed("/"+function);
      },
    );
  }
}