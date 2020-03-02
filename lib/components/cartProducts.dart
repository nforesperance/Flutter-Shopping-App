import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productOnTheCart = [
    {
      "name": "Pants",
      "picture": "assets/images/products/pants2.jpeg",
      "price": 50,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "Blazer",
      "picture": "assets/images/products/blazer1.jpeg",
      "price": 50,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "Dress",
      "picture": "assets/images/products/dress1.jpeg",
      "price": 50,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "Skirt",
      "picture": "assets/images/products/skt2.jpeg",
      "price": 50,
      "size": "7",
      "color": "Red",
      "quantity": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productOnTheCart.length,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            cartProdName: productOnTheCart[index]['name'],
            cartProdPicture: productOnTheCart[index]['picture'],
            cartProdPrice: productOnTheCart[index]['price'],
            cartSize: productOnTheCart[index]['size'],
            cartColor: productOnTheCart[index]['color'],
            cartQuantity: productOnTheCart[index]['quantity'],
          );
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProdName;
  final cartProdPicture;
  final cartProdPrice;
  final cartSize;
  final cartQuantity;
  final cartColor;
  SingleCartProduct(
      {this.cartProdName,
      this.cartProdPicture,
      this.cartProdPrice,
      this.cartSize,
      this.cartQuantity,
      this.cartColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // ======Leading=======
        leading: Image.asset(
          cartProdPicture,
          fit: BoxFit.cover,
          width: 80,
          height: 80,
        ),

        // =========Title Section=====
        title: Text(cartProdName),

        // ======Subtitle section=====
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                // Size of product
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 4, 4, 4),
                    child: Text("Size:")),
                Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      cartSize,
                      style: TextStyle(color: Colors.red),
                    )),

                // Color if product
                Padding(
                    padding: EdgeInsets.fromLTRB(40, 8, 8, 8),
                    child: Text("Color:")),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(cartColor, style: TextStyle(color: Colors.red)),
                ),
              ],
            ),

            // Product price
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "\$$cartProdPrice",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            )
          ],
        ),

        // Trailling
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Column(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.arrow_drop_up, color: Colors.red),
                  iconSize: 38,
                  onPressed: () {}),
              Text(
                '$cartQuantity',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.red,
                  ),
                  iconSize: 38,
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

}
