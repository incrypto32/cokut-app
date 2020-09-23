import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            // color: Colors.amber,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              // clipBehavior: Clip.hardEdge,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 150,
                  viewportFraction: 1.0,
                  disableCenter: true,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                ),
                items: [
                  "https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
                ].map((e) {
                  return Image.network(
                    e,
                    fit: BoxFit.cover,
                  );
                }).toList(),
              ),
            ),
          ),
          ...[
            buildCategoryStack(
              asset: 'assets/images/specials.png',
              category: "Specials",
            ),
            buildCategoryStack(
              asset: 'assets/images/restaurants.png',
              category: "Restaurants",
              opposite: true,
            ),
            buildCategoryStack(
              asset: 'assets/images/homemade.png',
              category: "Homemade",
            ),
            buildCategoryStack(
              asset: 'assets/images/spicey.png',
              category: "Spicey",
              opposite: true,
            ),
          ],
        ],
      ),
    );
  }

  Container buildCategoryStack(
      {String asset, bool opposite = false, String category}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(asset),
          ),
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 45),
              alignment:
                  opposite ? Alignment.centerLeft : Alignment.centerRight,
              child: Text(
                category,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
