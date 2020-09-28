import 'package:cokut/models/cartItem.dart';
import 'package:cokut/presentation/widgets/components/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';

class CartWidget extends StatefulWidget {
  const CartWidget();
  @override
  CartWidgetState createState() => CartWidgetState();
}

class CartWidgetState extends State<CartWidget> {
  final fee = 15.00;
  final hpad = 15.0;
  final ordFont = 20.0;

  @override
  Widget build(BuildContext context) {
    CartRepository cartItemHandler = CartRepository();
    cartItemHandler.initCartItem();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your Food Cart", style: Theme.of(context).textTheme.headline5),
          getCartItemList(cartItemHandler), //from cartItem handler class
          SizedBox(height: 3.0),
          getBillDetails(cartItemHandler),
          SizedBox(height: 8.0),
          Text("Address Details", style: TextStyle(fontSize: 18.0)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: hpad),
            child: Container(
              height: 75.0,
              alignment: Alignment.center,
              color: Colors.white,
              child: RaisedButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text("+Add Address"),
                elevation: 5.0,
                onPressed: () {
                  print("Current Address");
                },
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 40.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: RaisedButton(
                color: Colors.green,
                child: Text(
                  "PLACE ORDER",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                onPressed: () {
                  print(
                      "Your Grand total is ${getTotal(cartItemHandler.getCartItems()) + fee}");
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  //widget for getting bill
  Widget getBillDetails(CartRepository cartItemHandler) {
    List<CartItem> items = cartItemHandler.getCartItems();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: hpad),
      height: 165.00,
      //padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: ListView(
        children: [
          Container(
            color: Colors.white,
            child: ListTile(
              title: Text("Items Total"),
              trailing: Text("${getTotal(items)}"),
            ),
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              title: Text("Delivery Fee"),
              trailing: Text("$fee"),
            ),
          ),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.black),
                ),
                color: Colors.white),
            //color: Colors.white,
            child: ListTile(
              title: Center(
                child: Text("Total"),
              ),
              trailing: Text("${getTotal(items) + fee}"),
            ),
          )
        ],
      ),
    );
  }

  //widget for getting cartItem list
  Widget getCartItemList(CartRepository cartItemHandler) {
    return CartItems(
        hpad: hpad, cartItemHandler: cartItemHandler, ordFont: ordFont);
  }

  double getTotal(List<CartItem> items) {
    double total = 0;
    //List<CartItem> ord = getCartItem();
    items.forEach((cartItem) {
      total += cartItem.price * cartItem.count;
    });
    return total;
  }
}

class CartItems extends StatelessWidget {
  const CartItems({
    Key key,
    @required this.hpad,
    @required this.cartItemHandler,
    @required this.ordFont,
  }) : super(key: key);

  final double hpad;
  final CartRepository cartItemHandler;
  final double ordFont;

  @override
  Widget build(BuildContext context) {
    var items = cartItemHandler.getCartItems();
    return Container(
      height: 175.00,
      padding: EdgeInsets.symmetric(horizontal: hpad),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return MealTile(
            name: items[index].name,
            hotel: items[index].hotel,
            price: items[index].price,
            count: items[index].count,
          );
        },
      ),
    );
  }
}
