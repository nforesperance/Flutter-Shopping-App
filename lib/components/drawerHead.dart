import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/utils/firebase_auth.dart';

class DrawerHead extends StatefulWidget {
  @override
  _DrawerHeadState createState() => _DrawerHeadState();
}

class _DrawerHeadState extends State<DrawerHead> {
  @override
  Widget build(BuildContext context) {
    Widget child;
    final user = Provider.of<UserRepository>(context);
    if (user.photoUrl != "") {
      child = UserAccountsDrawerHeader(
        accountName: Text(user.name),
        accountEmail: Text(user.email),
        currentAccountPicture: GestureDetector(
            child: ClipRRect(
          borderRadius: BorderRadius.circular(37.0),
          child: Image.network(
            user.photoUrl,
            fit: BoxFit.fill,
            height: 200.0,
            width: 200.0,
          ),
        )),
        decoration: BoxDecoration(color: Colors.pink),
      );
    } else {
      child = UserAccountsDrawerHeader(
        accountName: Text(user.name),
        accountEmail: Text(user.email),
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
      );
    }
    return Container(
      child: child,
    );
  }
}
