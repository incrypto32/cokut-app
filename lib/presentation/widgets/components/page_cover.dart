import 'package:flutter/material.dart';

class PageCover extends StatelessWidget {
  const PageCover({
    Key key,
    @required this.heading,
  }) : super(key: key);

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.centerLeft,
          image: AssetImage('assets/images/specials.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(60)),
      ),
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              heading,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(color: Colors.black, blurRadius: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
