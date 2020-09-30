import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Image.asset(
          'assets/images/blaksid.png',
          height: 40,
        ),
      ),
      body: SingleChildScrollView(
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
                    "assets/images/1.jpg",
                    "assets/images/2.jpg",
                  ].map((e) {
                    return Image.asset(
                      e,
                      fit: BoxFit.cover,
                    );
                  }).toList(),
                ),
              ),
            ),
            ...[
              buildCategoryStack(
                context,
                asset: 'assets/images/special.png',
                category: "Specials",
              ),
              buildCategoryStack(
                context,
                asset: 'assets/images/restaurants.png',
                category: "Restaurants",
                opposite: true,
              ),
              buildCategoryStack(
                context,
                asset: 'assets/images/homemade.png',
                category: "Homemade",
              ),
              buildCategoryStack(
                context,
                asset: 'assets/images/spicey.png',
                category: "Spicey",
                opposite: true,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget buildCategoryStack(BuildContext context,
      {String asset, bool opposite = false, String category}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/" + category.toLowerCase());
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colors.blueGrey,
            child: Stack(
              children: [
                Image.asset(
                  asset,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
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
          ),
        ),
      ),
    );
  }
}
