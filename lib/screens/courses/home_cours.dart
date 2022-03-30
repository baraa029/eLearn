import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_track/colorConst.dart';
import 'package:learning_track/provider/firestore_provider.dart';
import 'package:learning_track/router/router.dart';
import 'package:learning_track/screens/courses/allcourse.dart';
import 'package:learning_track/widget/cours_widget.dart';
import 'package:provider/provider.dart';

import '../../models/category.dart';
import 'constants.dart';
import 'details_screen_cours.dart';

class HomeCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 233, 252),
      body: Stack(
        children: [
          Blobs(),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 50, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: <Widget>[
                //     SvgPicture.asset("assets/icons/menu.svg"),
                //     Image.asset("assets/images/user.png"),
                //   ],
                // ),
                Text("Hey",
                    style: TextStyle(
                        color: ColorConst.backgroundbar,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Text("Find a course you want to learn",
                    style: TextStyle(color: ColorConst.titel, fontSize: 20)),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F7),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/search.svg"),
                      SizedBox(width: 16),
                      Text(
                        "Search for anything",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFA0A5BD),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Category",
                        style: TextStyle(
                            color: ColorConst.titel,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    InkWell(
                      onTap: () {
                        RouterClass.routerClass
                            .pushToSpecificScreenUsingWidget(Allcourse());
                      },
                      child: Text("See All",
                          style:
                              TextStyle(color: ColorConst.titel, fontSize: 18)),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Expanded(
                  child: MasonryGridView.count(
                    padding: EdgeInsets.all(0),
                    crossAxisCount: 2,
                    itemCount:
                        Provider.of<FireProvider>(context).courslist.length,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsCours(
                                  Provider.of<FireProvider>(context)
                                      .courslist[index]),
                            ),
                          );
                        },
                        child: Container(
                          color: Color.fromARGB(255, 223, 233, 252),
                          // padding: EdgeInsets.all(20),
                          height: index.isEven ? 200 : 240,
                          child: CachedNetworkImage(
                            imageUrl:
                                '${Provider.of<FireProvider>(context).courslist[index].image}',
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30),
              ],
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
