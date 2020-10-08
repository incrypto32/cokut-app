import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DraggableScrollableSheet'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.brown,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: DraggableScrollableSheet(
                expand: false,
                maxChildSize: .9,
                initialChildSize: .5,
                minChildSize: .2,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: 25,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text('Item $index'));
                    },
                  );
                },
              ),
            ),
            Flexible(
              child: DraggableScrollableSheet(
                expand: false,
                maxChildSize: .9,
                initialChildSize: .5,
                minChildSize: .2,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: 25,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text('Item $index'));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
