import 'package:flutter/material.dart';
import 'package:shopapp/main.dart';

class ProductDetails extends StatefulWidget {
  final detailName;
  final detailPicture;
  final detailOldPrice;
  final detailPrice;
  ProductDetails(
      {this.detailName,
      this.detailPicture,
      this.detailOldPrice,
      this.detailPrice});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.pink,
        title: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyApp();
            }));
          },
          child: Text('FashApp'),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                child: Image.asset(widget.detailPicture),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.detailName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text("\$${widget.detailOldPrice}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ))),
                      Expanded(
                          child: Text("\$${widget.detailPrice}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.red))),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // =======The First Button=====
          Row(
            children: <Widget>[
              //===== The size Button=====
              Expanded(
                child: MaterialButton(
                  elevation: 0.2,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Size"),
                            content: Text("Choose size"),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Close",
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text("Size")),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

              //===== The Color Button=====
              Expanded(
                child: MaterialButton(
                  elevation: 0.2,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Color"),
                            content: Text("Choose color"),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Close",
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text("Color")),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

              //===== The Quantity Button=====
              Expanded(
                child: MaterialButton(
                  elevation: 0.2,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Quantity"),
                            content: Text("Choose quantity"),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Close",
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text("Qty")),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // =======The Second  Button=====
          Row(
            children: <Widget>[
              //===== The buy Button=====
              Expanded(
                child: MaterialButton(
                  elevation: 0.2,
                  onPressed: () {},
                  color: Colors.pink,
                  textColor: Colors.white,
                  child: Text("Buy Now"),
                ),
              ),
              // add to Chart icone
              IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.pink,
                  onPressed: () {}),
              // Like Icon
              IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.pink,
                  onPressed: () {})
            ],
          ),
          Divider(),
          // Details
          ListTile(
            title: Text("Product details"),
            subtitle: Text(
                "Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem perspiciatis pariatur sunt natus, dolores exercitationem. Fuga maiores ex sit officia? Perferendis libero eos veniam beatae ipsa fugit maiores sit quaerat."),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child:
                    Text("Product name", style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.detailName),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child:
                    Text("Product brand", style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Brand X"),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text("Product condition",
                    style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("New"),
              ),
            ],
          ),

          Divider(),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Similar Products",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              )),
          // Similar product section
          Container(
            height: 360,
            child: SimilarProducts(),
          )
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var productList = [
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
          return SimilarSingleProd(
            productName: productList[index]['name'],
            prodPicture: productList[index]['picture'],
            prodOldPrice: productList[index]['old_price'],
            prodPrice: productList[index]['price'],
          );
        });
  }
}

class SimilarSingleProd extends StatelessWidget {
  final productName;
  final prodPicture;
  final prodOldPrice;
  final prodPrice;
  SimilarSingleProd(
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
