import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_track/screens/courses/vidoe.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'constants.dart';

class DetailsCours extends StatelessWidget {
  String videoIdd =
      YoutubePlayer.convertUrlToId('https://youtu.be/jHSdqFTgG2I');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF081430),
      // body: Container(
      //   width: double.infinity,
      //   decoration: BoxDecoration(
      //     color: Color(0xFFF5F4EF),
      //     image: DecorationImage(
      //       image: AssetImage("assets/images/ux_big.png"),
      //       alignment: Alignment.topRight,
      //     ),
      //   ),
      body: Column(
        children: <Widget>[
          // Padding(
          //   padding: EdgeInsets.only(left: 20, top: 50, right: 20),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: <Widget>[
          //           SvgPicture.asset("assets/icons/arrow-left.svg"),
          //           SvgPicture.asset("assets/icons/more-vertical.svg"),
          //         ],
          //       ),
          //       SizedBox(height: 30),
          //       ClipPath(
          //         clipper: BestSellerClipper(),
          //         child: Container(
          //           color: kBestSellerColor,
          //           padding: EdgeInsets.only(
          //               left: 10, top: 5, right: 20, bottom: 5),
          //           child: Text(
          //             "BestSeller".toUpperCase(),
          //             style: TextStyle(
          //               fontWeight: FontWeight.w600,
          //             ),
          //           ),
          //         ),
          //       ),
          //       SizedBox(height: 16),
          //       Text("Design Thinking", style: kHeadingextStyle),
          //       SizedBox(height: 16),
          //       Row(
          //         children: <Widget>[
          //           SvgPicture.asset("assets/icons/person.svg"),
          //           SizedBox(width: 5),
          //           Text("18K"),
          //           SizedBox(width: 20),
          //           SvgPicture.asset("assets/icons/star.svg"),
          //           SizedBox(width: 5),
          //           Text("4.8")
          //         ],
          //       ),
          //       SizedBox(height: 20),
          //       RichText(
          //         text: TextSpan(
          //           children: [
          //             TextSpan(
          //               text: "\$50 ",
          //               style: kHeadingextStyle.copyWith(fontSize: 32),
          //             ),
          //             TextSpan(
          //               text: "\$70",
          //               style: TextStyle(
          //                 color: kTextColor.withOpacity(.5),
          //                 decoration: TextDecoration.lineThrough,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 50,),
          Container(
            height: 30,
            color: Color.fromARGB(255, 221, 217, 217),
          ),
          YoutubeAppDemo(videoIdd),
          // SizedBox(height: 60),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color:Color(0xFF081430),
              ),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Course Content", style: kTitleTextStyle),
                        SizedBox(height: 30),
                        InkWell(
                          onTap: () {},
                          child: CourseContent(
                            number: "01",
                            duration: 5.35,
                            title: "Welcome to the Course",
                            isDone: true,
                          ),
                        ),
                        CourseContent(
                          number: '02',
                          duration: 19.04,
                          title: "Design Thinking - Intro",
                          isDone: true,
                        ),
                        CourseContent(
                          number: '03',
                          duration: 15.35,
                          title: "Design Thinking Process",
                        ),
                        CourseContent(
                          number: '04',
                          duration: 5.35,
                          title: "Customer Perspective",
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 50,
                            color: kTextColor.withOpacity(.1),
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(14),
                            height: 56,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFEDEE),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: SvgPicture.asset(
                                "assets/icons/shopping-bag.svg"),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: kBlueColor,
                              ),
                              child: Text(
                                "Buy Now",
                                style: kSubtitleTextSyule.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
              color: Color(0xFFFFD073),
              fontSize: 32,
            ),
          ),
          SizedBox(width: 8),
          RichText(
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
