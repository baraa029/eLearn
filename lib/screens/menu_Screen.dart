import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_track/colorConst.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class menuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 233, 252),
      body: Stack(
        children: [
          Blobs(),
          SingleChildScrollView(
            child: Container(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 70.h)),
                  InkWell(
                    onTap: () {
                      // RouterClass.route.pushToSecificSccrrenUsingWidget(Profile());
                    },
                    child: CircleAvatar(
                        radius: 50.r,
                        backgroundImage: Provider.of<AuthProvider>(context)
                                    .loggedUser ==
                                null
                            ? AssetImage('assets/profile.jpg')
                            // : Provider.of<AuthProvider>(context)
                            //             .loggedUser
                            //             .image ==
                            //         null
                            //     ? AssetImage('assets/car.jpg')
                            : NetworkImage(
                                '${Provider.of<AuthProvider>(context).loggedUser.image}')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.h, left: 20.w),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: Icon(Icons.person,
                              size: 35, color: ColorConst.backgroundbar),
                        ),
                        InkWell(
                          onTap: () async {
                            // await Provider.of<AuthProvider>(context, listen: false)
                            //     .getUserFromFirebase();
                            // Usermodel usermodel = await Provider.of<AuthProvider>(
                            //         context,
                            //         listen: false)
                            //     .loggedUser;
                            // RouterClass.route
                            //     .pushToSecificSccrrenUsingWidget(Profile());
                          },
                          child: Text(
                            'Profile',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: ColorConst.backgroundbar,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h, left: 20.w),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: Icon(
                            Icons.notifications,
                            size: 35,
                            color: ColorConst.backgroundbar,
                          ),
                        ),
                        Text(
                          'Notifications',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: ColorConst.backgroundbar,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h, left: 20.w),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: Icon(
                            Icons.help,
                            size: 35,
                            color: ColorConst.backgroundbar,
                          ),
                        ),
                        Text(
                          'Help',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: ColorConst.backgroundbar,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h, left: 20.w),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: Icon(
                            Icons.info_outline,
                            size: 35,
                            color: ColorConst.backgroundbar,
                          ),
                        ),
                        Text(
                          'About Us',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: ColorConst.backgroundbar,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h, left: 20.w),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: Icon(
                            Icons.star_border,
                            size: 35,
                            color: ColorConst.backgroundbar,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Center(
                                    child: Text(
                                      'Rating',
                                      style: TextStyle(
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  content: Container(
                                    // color: Colors.amber,
                                    height: 70.h,
                                    width: 300.w,
                                    child: Row(
                                      children: [
                                        RatingBar.builder(
                                          itemSize: 45,
                                          // initialRating: task1.stars,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            'Rate Us',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: ColorConst.backgroundbar,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 70.h, left: 20.w),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: Icon(
                            Icons.logout,
                            size: 35,
                            color: ColorConst.titel,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Provider.of<AuthProvider>(context, listen: false)
                                .logOut();
                          },
                          child: Text(
                            'Logout',
                            style: TextStyle(
                                fontSize: 23,
                                color: ColorConst.titel,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Blobs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -200,
          top: -50,
          child: Image.asset(
            'assets/images/blobs/Blob 1.png',
            color: Color(0xFF579ACA).withOpacity(0.55),
          ),
        ),
        Positioned(
          top: -250,
          right: -200,
          child: Image.asset(
            'assets/images/blobs/Blob2.png',
            color: Color(0xFF4E92B1).withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}
