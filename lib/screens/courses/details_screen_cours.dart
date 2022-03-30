import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learning_track/colorConst.dart';
import 'package:learning_track/models/Car_model.dart';
import 'package:learning_track/provider/firestore_provider.dart';
import 'package:learning_track/router/router.dart';
import 'package:learning_track/screens/courses/vidoe.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'constants.dart';

class DetailsCours extends StatelessWidget {
  CourseModel courseModel;

  DetailsCours(this.courseModel);
  int x = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<FireProvider>(builder: (context, providerInstans, x) {
      return providerInstans.courslist.length == 0
          ? Scaffold(
              body: Center(
              child: CircularProgressIndicator(),
            ))
          : Scaffold(
              backgroundColor: Color.fromARGB(255, 223, 233, 252),
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    YoutubeAppDemo(YoutubePlayer.convertUrlToId(
                        courseModel.courseurl[providerInstans.indexVidoe])),
                    // SizedBox(height: 20),
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 223, 233, 252),
                      ),
                      child: Stack(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, right: 20, left: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Course Content",
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: Color.fromARGB(255, 166, 82, 192),
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height - 300,
                                  // color: Colors.amber,
                                  child: ListView.builder(
                                    // physics: NeverScrollableScrollPhysics(),
                                    itemCount: courseModel.coursename.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          providerInstans.changIndex(index);
                                          RouterClass.routerClass
                                              .pushWithReplacementToSpecificScreenUsingWidget(
                                                  DetailsCours(courseModel));
                                        },
                                        child: CourseContent(
                                          number: "0${index + 1}",
                                          duration: 5.35,
                                          title: courseModel.coursename[index],
                                          isDone: true,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Positioned(
                        //   right: 0,
                        //   left: 0,
                        //   bottom: 0,
                        //   child: Container(
                        //     padding: EdgeInsets.all(20),
                        //     height: 100,
                        //     width: double.infinity,
                        //     decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.circular(40),
                        //       boxShadow: [
                        //         BoxShadow(
                        //           offset: Offset(0, 4),
                        //           blurRadius: 50,
                        //           color: kTextColor.withOpacity(.1),
                        //         ),
                        //       ],
                        //     ),
                        //     child: Row(
                        //       children: <Widget>[
                        //         Container(
                        //           padding: EdgeInsets.all(14),
                        //           height: 56,
                        //           width: 80,
                        //           decoration: BoxDecoration(
                        //             color: Color(0xFFFFEDEE),
                        //             borderRadius: BorderRadius.circular(40),
                        //           ),
                        //           child: SvgPicture.asset(
                        //               "assets/icons/shopping-bag.svg"),
                        //         ),
                        //         SizedBox(width: 20),
                        //         Expanded(
                        //           child: Container(
                        //             alignment: Alignment.center,
                        //             height: 56,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(40),
                        //               color: kBlueColor,
                        //             ),
                        //             child: Text(
                        //               "Buy Now",
                        //               style: kSubtitleTextSyule.copyWith(
                        //                 color: Colors.white,
                        //                 fontWeight: FontWeight.bold,
                        //               ),
                        //             ),
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ]),
                    ))
                  ]));
    });
  }
}

class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;
  const CourseContent({
    this.number,
    this.duration,
    this.title,
    this.isDone = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 233, 93, 88)),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          children: <Widget>[
            Text(
              number,
              style: kHeadingextStyle.copyWith(
                color: Color(0xFFFFD073),
                fontSize: 32,
              ),
            ),
            SizedBox(width: 8),
            SizedBox(
              width: 220,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$title\n",
                      style: TextStyle(
                        color: Color(0xFFFFD073),
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: "$duration mins",
                      style: kSubtitleTextSyule.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 1.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kGreenColor.withOpacity(isDone ? 1 : .5),
              ),
              child: Icon(Icons.play_arrow, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
