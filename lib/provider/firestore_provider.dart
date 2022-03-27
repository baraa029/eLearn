import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../data/firestore_helper.dart';
import '../models/Car_model.dart';
import '../screens/courses/vidoe.dart';

class FireProvider extends ChangeNotifier {
  FireProvider() {}
  List<CourseModel> courslist;
  List urls = [];

  //////
  int indexcours = 0;
  String videoIdd;

  changindexvidoe(int indexvidoe) {
    indexcours = indexvidoe;
    log(indexcours.toString());
    notifyListeners();
  }

  Widget videoPlayer(CourseModel courseModel) {
    log(indexcours.toString());
    return YoutubeAppDemo(
      YoutubePlayer.convertUrlToId('${courseModel.courseurl[indexcours]}'),
    );
  }

  getAllcar() async {
    this.courslist = await FirestoreHelper.firestoreHelper.getAllCars();
    for (var i = 0; i < 1; i++) {
      for (var j = 0; j < courslist[i].courseurl.length; j++) {
        urls.add(YoutubePlayer.convertUrlToId(courslist[i].courseurl[j]));
        // print('elaila');
      }
      print('tareq');
    }

    log('Carslist');
    log('${urls}');
    // dowladAllCarimage();
    notifyListeners();
  }
}
