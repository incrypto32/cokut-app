import 'package:cokut/common/constants.dart';
import 'package:cokut/cubit/cart/cart_cubit.dart';
import 'package:cokut/presentation/widgets/main/cart_page.dart';
import 'package:cokut/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:cokut/presentation/widgets/main/home_page.dart';
import 'package:cokut/presentation/screens/search_screen.dart';
import 'package:cokut/presentation/widgets/main/settings_page.dart';
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
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemDeleted) {
          Utils.showFlushBar(context, "Item removed from cart");
        } else if (state is CartItemAdded) {
          Utils.showFlushBar(context, "Item added to cart");
        }
      },
      child: Scaffold(
        backgroundColor: ColorIt.hexToColor(ColorIt.mainBody),
        body: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
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
      ),
    );
  }
}
