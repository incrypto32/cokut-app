import 'package:badges/badges.dart';
import 'package:cokut/common/constants.dart';
import 'package:cokut/cubit/cart/cart_cubit.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:cokut/presentation/screens/main/cart_page.dart';
import 'package:flutter/material.dart';

import 'package:cokut/presentation/screens/main/home_page.dart';
import 'package:cokut/presentation/screens/main/search_screen.dart';
import 'package:cokut/presentation/screens/main/settings_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    SearchPage(),
    CartWidget(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorIt.hexToColor(ColorIt.mainBody),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon:
                BlocBuilder<CartCubit, CartState>(builder: (context, snapshot) {
              return Badge(
                showBadge:
                    !(context.repository<CartRepository>().itemNumber() == 0),
                badgeContent: Text(
                  "${context.repository<CartRepository>().itemNumber()}",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                child: Icon(Icons.shopping_basket),
              );
            }),
            title: Text('Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Person'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[600],
        onTap: _onItemTapped,
      ),
    );
  }
}
