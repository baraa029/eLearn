import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_track/models/Car_model.dart';
import 'package:learning_track/provider/firestore_provider.dart';
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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // YoutubeAppDemo(Provider.of<FireProvider>(context)
          //     .urls[Provider.of<FireProvider>(context).indexcours]),
          Provider.of<FireProvider>(context).videoPlayer(courseModel),
          SizedBox(height: 20),
          Container(
              margin: EdgeInsets.only(left: 20),
              child: Text("Course Content", style: kTitleTextStyle)),
          SizedBox(height: 10),
          Container(
            height: 500,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: courseModel.courseurl.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Provider.of<FireProvider>(context, listen: false)
                        .changindexvidoe(index);
                  },
                  child: CourseContent(
                    number: '0${index + 1}',
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
    );
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: <Widget>[
          Text(
            number,
            style: kHeadingextStyle.copyWith(
              color: kTextColor.withOpacity(.15),
              fontSize: 32,
            ),
          ),
          SizedBox(width: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$duration mins\n",
                  style: TextStyle(
                    color: kTextColor.withOpacity(.5),
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: title,
                  style: kSubtitleTextSyule.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ],
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
