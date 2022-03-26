import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../data/auth_helper.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  Usermodel loggedUser;
  bool disable = false;
  bool inits = true;
  changintstate(bool disabl) {
    inits = disabl;
    notifyListeners();
  }

  changdisable(bool disabl) {
    disable = disabl;
    notifyListeners();
  }

  Future<String> login({String email, String password}) async {
    try {
      UserCredential userCredential =
          await AuthHelper.authHelper.signIn(email, password);
      // await getUserFromFirebase();
      //RouterHelper.routerHelper.routingToSpecificWidget(AllProductsScreen());
      // RouterClass.route.pushReplacementUsingWidget(Myapp());
    } on Exception catch (e) {
      log('$e');
      return e.toString();
      //return 'user not record';
    }
  }

  Future<String> register(Usermodel usermodel) async {
    try {
      String userId = await AuthHelper.authHelper
          .createNewAccount(usermodel.email, usermodel.password);
      usermodel.id = userId;

      log('userId');
      log('$userId');
      if (userId.contains('email-already')) {
        return userId;
      } else {
        // await FirestoreHelper.firestoreHelper.createUserInFs(usermodel);
        this.loggedUser = usermodel;
        return null;
        // RouterClass.route.pushReplacementUsingWidget(Myapp());
      }

      // RouterHelper.routerHelper.routingToSpecificWidget(AllProductsScreen());
    } on Exception catch (e) {
      // TODO
      log('message');
    }
  }

  // getUserFromFirebase() async {
  //   String userId = FirebaseAuth.instance.currentUser.uid;
  //   this.loggedUser =
  //       await FirestoreHelper.firestoreHelper.getUserFromFs(userId);
  //   notifyListeners();
  // }

  // edituser(Usermodel usermodel) async {
  //   //  Usermodel userfack = usermodel.image = imageurl;
  //   await FirestoreHelper.firestoreHelper.editUser(usermodel);
  //   getUserFromFirebase();
  // }

  logOut() async {
    this.loggedUser = null;
    await AuthHelper.authHelper.logout();

    // RouterClass.route.pushReplacementUsingWidget(Login());

    // RouterHelper.routerHelper.routingToSpecificWidget(LoginScreen());
  }
}
