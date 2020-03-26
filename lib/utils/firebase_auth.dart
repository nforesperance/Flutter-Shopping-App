import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status {
  Uninitialized,
  Authenticated,
  Authenticating,
  Unauthenticated,
  Authenticating_Google,
  SignUp,
}

class UserRepository with ChangeNotifier {
  final FirebaseAuth auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  String email = "";
  String name = "";
  String photoUrl = "";

  //update
  SharedPreferences preferences;

  UserRepository.instance({this.auth}) {
    auth.onAuthStateChanged.listen(onAuthStateChanged);
  }

  Status get status => _status;
  FirebaseUser get user => _user;

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      this.email = email;
      this.name = name;
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future signOut() async {
    auth.signOut();
    this.email = "";
    this.name = "";
    this.photoUrl = "";
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> onAuthStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  Future<bool> loginWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await googleSignIn.signIn();
      if (account == null) return false;
      _status = Status.Authenticating_Google;
      notifyListeners();
      this.email = account.email;
      this.name = account.displayName;
      this.photoUrl = account.photoUrl;
      print(account.photoUrl);
      AuthResult res =
          await auth.signInWithCredential(GoogleAuthProvider.getCredential(
        idToken: (await account.authentication).idToken,
        accessToken: (await account.authentication).accessToken,
      ));
      if (res.user == null) return false;
      _status = Status.Authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      print(e.message);
      print("Error logging with google");
      return false;
    }
  }

  Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await googleSignIn.signIn();
      if (account == null) return false;
      _status = Status.Authenticating_Google;
      notifyListeners();
      this.email = account.email;
      this.name = account.displayName;
      this.photoUrl = account.photoUrl;
      print(account.photoUrl);
      AuthResult res =
          await auth.signInWithCredential(GoogleAuthProvider.getCredential(
        idToken: (await account.authentication).idToken,
        accessToken: (await account.authentication).accessToken,
      ));
      if (res.user == null) {
        Fluttertoast.showToast(msg: "Login Failed");
      } else {
        final QuerySnapshot result = await Firestore.instance
            .collection("users")
            .where("id", isEqualTo: res.user.uid)
            .getDocuments(); 
        final List<DocumentSnapshot> documents = result.documents;

        // if the user is not already stored in our own created users collection
        if (documents.length == 0) {
          // insert the user to our collection
          Firestore.instance
              .collection("users")
              .document(res.user.uid)
              .setData({
            "id": res.user.uid,
            "username": res.user.displayName,
            "photoUrl": res.user.photoUrl
          });
          await preferences.setString("id", res.user.uid);
          await preferences.setString("photoUrl", res.user.photoUrl);
          await preferences.setString("username", res.user.displayName);
        }

        // if user is not in our collection
        else {
          await preferences.setString("id", documents[0]["id"]);
          await preferences.setString("username", documents[0]["username"]);
          await preferences.setString("photoUrl", documents[0]["photoUrl"]);
        }
        Fluttertoast.showToast(msg: "Login was successful");

        _status = Status.Authenticated;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print(e.message);
      print("Error logging with google");
      return false;
    }
  }
   Future signUpPage() async {
    _status = Status.SignUp;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
   Future signInPage() async {
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
}
