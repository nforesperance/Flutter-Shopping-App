import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/Components/horizontal_listview.dart';
import 'package:shopapp/Components/product.dart';
import 'package:shopapp/pages/cart.dart';
import 'package:shopapp/utils/firebase_auth.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/images/c1.jpg'),
          AssetImage('assets/images/m1.jpeg'),
          AssetImage('assets/images/w3.jpeg'),
          AssetImage('assets/images/w4.jpeg'),
          AssetImage('assets/images/m2.jpg'),
        ],
        autoplay: false,
        // animationCurve: Curves.fastOutSlowIn,
        // animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        //size of black "footer"
        indicatorBgPadding: 2,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.pink,
        title: Text('FashApp'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Cart();
                }));
              })
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // header
            UserAccountsDrawerHeader(
              accountName: Text('Nfor'),
              accountEmail: Text('nforesperance1@gmal.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.pink),
            ),

            //body

            // InkWell changes a widget into a button (makes it clickable)

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(
                  Icons.home,
                  color: Colors.pink,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(
                  Icons.person,
                  color: Colors.pink,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.pink,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Cart();
                }));
              },
              child: ListTile(
                title: Text('Shopping Cart'),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.pink,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(
                  Icons.help,
                ),
              ),
            ),

            InkWell(
              onTap: () {
                AuthProvider().logOut();
              },
              child: ListTile(
                title: Text('Log Out'),
                leading: Icon(
                  Icons.lock_open,
                ),
              ),
            ),


          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          // ===You can uncomment this to add carousel========
          // imageCarousel,

          //The padding is applied on the child
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Container(child: Text("Categories"),
            alignment: Alignment.centerLeft ,
            ),
          ),

          // Horizontal list view begins here
          HorizontalList(),

          Padding(
            padding: EdgeInsets.all(4.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text("Recent Products")),
          ),

          // grid view
          Flexible(child: Products()),
        ],
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text("Home page"),
//             RaisedButton(
//               child: Text("Log out"),
//               onPressed: (){
//                 AuthProvider().logOut();
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }