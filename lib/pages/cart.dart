import 'package:flutter/material.dart';
import 'package:shopapp/components/cartProducts.dart';



class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.pink,
        title: Text('Cart'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: CartProducts(),
      bottomNavigationBar: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                title: Text("Total"),
                subtitle: Text("\$230"),
              )),
              Expanded(
                child: MaterialButton(
                  onPressed: (){

                  },
                  child: Text(
                    "Check out",
                    style: TextStyle(color:Colors.white),
                    ),
                  color: Colors.pink,
                  ))
            ],
          )),
    );
  }
}
