import 'package:cokut/presentation/widgets/components/micro/cart_reminder.dart';
import 'package:flutter/material.dart';

class CartReminderFrame extends StatelessWidget {
  const CartReminderFrame({Key key, @required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: child,
        ),
        CartReminder(),
      ],
    );
  }
}
