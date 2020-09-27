import 'package:flutter/material.dart';

class IncrementWidget extends StatefulWidget {
  int count;
  IncrementWidget(this.count);
  @override
  _IncrementWidgetState createState() => _IncrementWidgetState(count);
}

class _IncrementWidgetState extends State<IncrementWidget> {
  int count;
  _IncrementWidgetState(this.count);
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 75.0,
      decoration:
      BoxDecoration(border: Border.all(color: Colors.black)),

      //row for choosing count
      child: Row(
        children: [
          GestureDetector(
            child: Icon(
              Icons.add,
            ),
            onTap: () {
              print("${count} add");
              increment();
              //cartItemHandler.incrementCartItem(index);

            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text("${count}"),
          ),
          GestureDetector(
              child: Icon(
                Icons.remove,
              ),
              onTap: () {
                print("${count} minus");
                decrement();
           //     cartItemHandler.decrementCartItem(index);
              }),
        ],
      ),
    );
  }

  void increment(){
    setState(() {
      count++;
    });
  }
  void decrement(){
    setState(() {
      count>0?count--:0;
    });
  }
}
