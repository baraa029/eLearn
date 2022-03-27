import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import '../models/Car_model.dart';
import '../models/user_model.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<String> downloadImage(String collection, String logoName) async {
    String imageUrl =
        await firebaseStorage.ref('$collection/$logoName').getDownloadURL();
    // print('imageUrl');
    // print(imageUrl);
    return imageUrl;
  }

  Future<List<Car>> getAllCars() async {
    QuerySnapshot<Map<String, dynamic>> allProductsSnapshot =
        await firebaseFirestore.collection('Car').get();

    List<Car> allProducts = allProductsSnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['id'] = e.id;
      Car product = Car.fromMap(documentMap);
      log('${product.name}');
      return product;
    }).toList();
    log('allProducts');
    log('${allProducts}');
    return allProducts;
  }

  Future<List<Car>> getOneCar(
      {@required String classification, @required String object}) async {
    QuerySnapshot<Map<String, dynamic>> allProductsSnapshot =
        await firebaseFirestore
            .collection('Car')
            .where(classification, isEqualTo: object)
            .get();

    List<Car> allCar = allProductsSnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['id'] = e.id;
      // documentMap['imageurl'] = downloadImage('Cars', );
      Car product = Car.fromMap(documentMap);
      return product;
    }).toList();
    return allCar;
  }

  Future<List> getAlllogocompany() async {
    DocumentSnapshot<Map<String, dynamic>> productSnapshot =
        await firebaseFirestore.collection('Logo').doc('logo').get();
    Map<String, dynamic> logoMap = productSnapshot.data();
    List logo = logoMap['logolist'];
    print('logo');
    print(logo);
    return logo;
  }

  Future<List> getAlllogotype() async {
    DocumentSnapshot<Map<String, dynamic>> productSnapshot =
        await firebaseFirestore.collection('Logo').doc('logo').get();
    Map<String, dynamic> logoMap = productSnapshot.data();
    List type = logoMap['logotype'];
    print('type');
    print(type);
    return type;
  }

  createUserInFs(Usermodel usermodel) async {
    firebaseFirestore
        .collection('users')
        .doc(usermodel.id)
        .set(usermodel.toMap());
  }

  addProductToFaviret(Car car) async {
    //Get id user
    String myid = FirebaseAuth.instance.currentUser.uid;
    firebaseFirestore
        .collection('users')
        .doc(myid)
        .collection('Faviret')
        .doc(car.id)
        .set(car.toMap());
  }

  getProductToFaviret() async {
    String myid = FirebaseAuth.instance.currentUser.uid;
    QuerySnapshot<Map<String, dynamic>> allProductsSnapshot =
        await firebaseFirestore
            .collection('users')
            .doc(myid)
            .collection('Faviret')
            .get();

    List<Car> allProducts = allProductsSnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['id'] = e.id;
      Car product = Car.fromMap(documentMap);
      log('${product.name}');
      return product;
    }).toList();
    log('allProducts');
    log('${allProducts}');
    return allProducts;
  }

  deletProductToFaviret(Car car) async {
    String myid = FirebaseAuth.instance.currentUser.uid;
    firebaseFirestore
        .collection('users')
        .doc(myid)
        .collection('Faviret')
        .doc(car.id)
        .delete();
  }

  Future<Usermodel> getUserFromFs() async {
    DocumentSnapshot<Map<String, dynamic>> document = await firebaseFirestore
        .collection('test')
        .doc('iJkME8Aq76AmC5H9iPxn')
        .get();
    Map<String, dynamic> userData = document.data();
    log(userData.toString());
    userData['id'] = document.id;
    Usermodel gdUser = Usermodel.fromMap(userData);
    log('${gdUser.toMap()}');
    return gdUser;
  }

  Future<String> uploadImage(File file) async {
    String filePath = file.path;
    String fileName = filePath.split('/').last;
    Reference reference = firebaseStorage.ref('users/$fileName');
    await reference.putFile(file);
    String imageUrl = await reference.getDownloadURL();
    return imageUrl;
  }

  editUser(Usermodel usermodel) async {
    await firebaseFirestore
        .collection('users')
        .doc(usermodel.id)
        .update(usermodel.toMap());
  }

  updatefavorite(Car car) async {
    await firebaseFirestore.collection('Car').doc(car.id).update(car.toMap());
  }
}
