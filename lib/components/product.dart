import 'package:flutter/material.dart';
import 'package:shopapp/pages/productDetails.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Blazer",
      "picture": "assets/images/products/blazer1.jpeg",
      "old_price": 239,
      "price": 137
    },
    {
      "name": "Red Dress",
      "picture": "assets/images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50
    },
    {
      "name": "Pants",
      "picture": "assets/images/products/pants2.jpeg",
      "old_price": 100,
      "price": 50
    },
    {
      "name": "Hills",
      "picture": "assets/images/products/hills2.jpeg",
      "old_price": 100,
      "price": 50
    },
    {
      "name": "Blaxer X",
      "picture": "assets/images/products/blazer2.jpeg",
      "old_price": 100,
      "price": 50
    },
    {
      "name": "Skirt",
      "picture": "assets/images/products/skt2.jpeg",
      "old_price": 100,
      "price": 50
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(4.0),
            child: SingleProd(
              productName: productList[index]['name'],
              prodPicture: productList[index]['picture'],
              prodOldPrice: productList[index]['old_price'],
              prodPrice: productList[index]['price'],
            ),
          );
        });
  }
}

class SingleProd extends StatelessWidget {
  final productName;
  final prodPicture;
  final prodOldPrice;
  final prodPrice;
  SingleProd(
      {this.productName, this.prodPicture, this.prodOldPrice, this.prodPrice});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: productName,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails(
                        detailName: productName,
                        detailPicture: prodPicture,
                        detailOldPrice: prodOldPrice,
                        detailPrice: prodPrice,
                      ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            productName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Text(
                          "\$$prodPrice",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  child: Image.asset(prodPicture, fit: BoxFit.cover)),
            ),
          )),
    );
  }
}
