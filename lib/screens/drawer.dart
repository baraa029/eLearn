import 'package:drawer_swipe/drawer_swipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_track/screens/main_screen.dart';
import 'package:provider/provider.dart';

import '../router/RouterClass.dart';
import '../provider/auth_provider.dart';
import '../router/RouterClass.dart';

class DrawerScreen extends StatelessWidget {
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
      body: SwipeDrawer(
        radius: 10,
        bodySize: 130,
        key: RouterClass.route.drawerKey,

        hasClone: false,
        bodyBackgroundPeekSize: 30,
        backgroundColor: Colors.amber,
        curve: Curves.easeInQuad,

        drawer: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(bottom: 130.h)),
              InkWell(
                onTap: () {
                  // RouterClass.route.pushToSecificSccrrenUsingWidget(Profile());
                },
                child: CircleAvatar(
                    radius: 40,
                    backgroundImage: Provider.of<AuthProvider>(context)
                                .loggedUser ==
                            null
                        ? AssetImage('assets/tareq.jpeg')
                        // : Provider.of<AuthProvider>(context)
                        //             .loggedUser
                        //             .image ==
                        //         null
                        //     ? AssetImage('assets/car.jpg')
                        : NetworkImage(
                            '${Provider.of<AuthProvider>(context).loggedUser.image}')),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h, left: 20.w),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: Icon(
                        Icons.person,
                        size: 35,
                        color: Colors.white,
                      ),
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
                            color: Colors.white,
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
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Notifications',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
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
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Help',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
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
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'About Us',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
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
                        color: Colors.white,
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
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 2.0),
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
                            color: Colors.white,
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
                        color: Colors.white,
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
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // pass body widget
        child: myApp(),
      ),
    );
  }
}
