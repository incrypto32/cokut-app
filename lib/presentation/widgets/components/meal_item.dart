import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealTile extends StatelessWidget {
  const MealTile({
    Key key,
    @required this.name,
    @required this.hotel,
    @required this.price,
    @required this.count,
  }) : super(key: key);

  final String name;
  final String hotel;
  final double price;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(fontSize: 15),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hotel,
              style: TextStyle(fontSize: 12),
            ),
            Text(
              "${price}",
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        trailing: IncrementWidget(),
      ),
    );
  }
}

class IncrementWidget extends StatelessWidget {
  IncrementWidget();
  static int _count = 0;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, StateSetter setState) {
        void increment() {
          setState(() {
            _count++;
          });
        }

        void decrement() {
          setState(() {
            _count > 0 ? _count-- : 0;
          });
        }

        return Container(
          width: 75.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          //row for choosing count
          child:
//          Row(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: [
//              Expanded(
//                child: SizedBox(
//                  height: 32.0,
//                  child: IconButton(
//                    icon: Icon(
//                      Icons.remove,
//                      size: 19.0,
//                    ),
//                    onPressed: () {
//                      print("${_count} minus");
//                      decrement();
//                    },
//                  ),
//                ),
//              ),
//
//              Expanded(
//                child: Container(
////                padding: EdgeInsets.only(left: 4.0),
//                      alignment: Alignment.center,
//                      width: 25.0,
//                      height: 32.0,
//                      child: Padding(
//                          padding: EdgeInsets.only(left:0.0,),
//                          child: Text("${_count}",))),
//              ),
//
//              Expanded(
//                child: Container(
//                  //alignment: Alignment.centerLeft,
//                  height: 32.0,
//                  child: Padding(
//                    padding: EdgeInsets.only(right:4.0),
//                    child: IconButton(
//                      icon: Icon(
//                        Icons.add,
//                        size: 19.0,
//                      ),
//                      onPressed: () {
//                        print("${_count} add");
//                        increment();
//                      },
//                    ),
//                  ),
//                ),
//              ),
//
//            ],
//          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 16.0,
                height: 32.0,
               // color: Colors.blue,
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(
                    Icons.remove,
                    size: 19.0,
                  ),
                  onPressed: () {
                    print("${_count} minus");
                    decrement();
                  },
                ),
              ),

              Container(
               // padding: EdgeInsets.only(left: 2.0),
                    alignment: Alignment.centerRight,
                //    color: Colors.red,
                    width: 25.0,
                    height: 32.0,
                    child: Container(
//                        padding: EdgeInsets.only(left:3.0,),
                        child: Text("${_count}",))),
              Container(
             //   color: Colors.blue,
                width: 22.0,
                height: 32.0,
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 19.0,
                    ),
                    onPressed: () {
                      print("${_count} add");
                      increment();
                    },
                  ),
                ),



            ],
          ),
        );
      },
    );
  }
}
