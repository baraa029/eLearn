import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:learning_track/models/bookModel.dart';

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

  Future<List<CourseModel>> getAllcourse() async {
    QuerySnapshot<Map<String, dynamic>> allProductsSnapshot =
        await firebaseFirestore.collection('courses').get();

    List<CourseModel> allProducts = allProductsSnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['id'] = e.id;
      CourseModel product = CourseModel.fromMap(documentMap);
      log('${product.coursename}');
      return product;
    }).toList();
    log('allProducts');
    log('${allProducts}');
    return allProducts;
  }

  Future<List<Book>> getAllbook() async {
    QuerySnapshot<Map<String, dynamic>> allProductsSnapshot =
        await firebaseFirestore.collection('Book').get();

    List<Book> allProducts = allProductsSnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['id'] = e.id;
      Book product = Book.fromMap(documentMap);
      log('${product.name}');
      return product;
    }).toList();
    log('allbook');
    log('${allProducts}');
    return allProducts;
  }

  Future<List<CourseModel>> getOneCar(
      {@required String classification, @required String object}) async {
    QuerySnapshot<Map<String, dynamic>> allProductsSnapshot =
        await firebaseFirestore
            .collection('Car')
            .where(classification, isEqualTo: object)
            .get();

    List<CourseModel> allCar = allProductsSnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['id'] = e.id;
      // documentMap['imageurl'] = downloadImage('Cars', );
      CourseModel product = CourseModel.fromMap(documentMap);
      return product;
    }).toList();
    return allCar;
  }
}
