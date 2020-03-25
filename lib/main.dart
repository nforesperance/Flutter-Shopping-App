import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screens/homepage.dart';
import 'package:shopapp/screens/login.dart';
import 'package:shopapp/screens/splash.dart';

import 'utils/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: MainScreen(),
    // );
    return ChangeNotifierProvider(
      create: (_) => UserRepository.instance(auth: FirebaseAuth.instance),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthHomePage(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return SplashPage();
        if (!snapshot.hasData || snapshot.data == null) return LoginPage();
        return HomePage();
      },
    );
  }
}

class AuthHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, UserRepository user, _) {
        switch (user.status) {
          case Status.Uninitialized:
            return SplashPage();
          case Status.Unauthenticated:
            return LoginPage();
          case Status.Authenticating:
            return SplashPage();
          case Status.Authenticating_Google:
            return SplashPage();
          case Status.Authenticated:
            return HomePage();
        }
      },
    );
  }
}
