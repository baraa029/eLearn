import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learning_track/models/bookModel.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../data/firestore_helper.dart';
import '../models/Car_model.dart';
import '../screens/courses/vidoe.dart';

class FireProvider extends ChangeNotifier {
  FireProvider() {}
  List<CourseModel> courslist;
  List<Book> booklist;
  List<Book> reversbooklist;
  List urls = [];

  int indexVidoe = 0;
  changIndex(int index) {
    indexVidoe = index;

    log(indexVidoe.toString());
    notifyListeners();
  }

  getAllcourse() async {
    this.courslist = await FirestoreHelper.firestoreHelper.getAllcourse();

    log('Carslist');
    log('${urls}');

    notifyListeners();
  }

  getAllbook() async {
    this.booklist = await FirestoreHelper.firestoreHelper.getAllbook();
    reversbooklist = booklist.reversed.toList();
    notifyListeners();
  }
}
