import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
              imageLocation: 'assets/images/cats/tshirt.png',
              imageCaption: 'T Shirts'),
          Category(
              imageLocation: 'assets/images/cats/dress.png',
              imageCaption: 'Dresses'),
          Category(
              imageLocation: 'assets/images/cats/jeans.png',
              imageCaption: 'Jeans'),
          Category(
              imageLocation: 'assets/images/cats/informal.png',
              imageCaption: 'Informal'),
          Category(
              imageLocation: 'assets/images/cats/shoe.png',
              imageCaption: 'Shoes'),
          Category(
              imageLocation: 'assets/images/cats/accessories.png',
              imageCaption: 'Accessories'),
          Category(
              imageLocation: 'assets/images/cats/formal.png',
              imageCaption: 'Formal'),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category({this.imageLocation, this.imageCaption});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 80,
            child: ListTile(
              title: Image.asset(
                imageLocation
              ),
              // subtitle: Container(
              //   alignment: Alignment.topCenter,
              //   child: Text(imageCaption),
              // ),
            ),
          ),
        ));
  }
}
