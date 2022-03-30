import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learning_track/colorConst.dart';
import 'package:learning_track/router/router.dart';
import 'package:learning_track/screens/stories/detail_screen.dart';
import 'package:learning_track/screens/webviwe.dart';

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

List<String> images = [
  "assets/images/course/letter.jpg",
  "assets/images/course/number.jpg",
  "assets/images/course/big.jpg",
  "assets/images/course/body.jpg",
  "assets/images/course/alphabets.jpg",
  "assets/images/course/num.jpg",
  "assets/images/course/days.jpg",
];

List<String> title = [
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
];

class CustomIcons {
  static const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");
  static const IconData option = IconData(0xe902, fontFamily: "CustomIcons");
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = images.length - 1.0;
  selectElearn(int index) {
    switch (index) {
      case 0:
        RouterClass.routerClass
            .pushToSpecificScreenUsingWidget(Elearning('letter'));
        break;
      case 1:
        RouterClass.routerClass
            .pushToSpecificScreenUsingWidget(Elearning('number'));
        break;
      case 2:
        RouterClass.routerClass
            .pushToSpecificScreenUsingWidget(Elearning('family'));
        break;
      case 3:
        RouterClass.routerClass
            .pushToSpecificScreenUsingWidget(Elearning('Bodyparts'));
        break;
      case 4:
        RouterClass.routerClass
            .pushToSpecificScreenUsingWidget(Elearning('letterno'));
        break;
      case 5:
        RouterClass.routerClass
            .pushToSpecificScreenUsingWidget(Elearning('numbertow'));
        break;
      case 6:
        RouterClass.routerClass
            .pushToSpecificScreenUsingWidget(Elearning('DAYS'));
        break;

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 216, 253),
      body: Stack(
        children: [
          Blobs(),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Stories",
                  style: TextStyle(
                    color: ColorConst.backgroundbar,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending",
                        style: TextStyle(
                            fontFamily: "Calibre-Semibold",
                            color: ColorConst.titel,
                            fontWeight: FontWeight.w500,
                            fontSize: 35,
                            letterSpacing: 1.0),
                      ),
                      IconButton(
                        icon: Icon(Icons.more, size: 30, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                          // color: Color(0xFFff6e6e),
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 6.0),
                          child: Center(
                            child: Text(
                              "Animated",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "25+ Stories",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    CardScrollWidget(currentPage),
                    Positioned.fill(
                      child: PageView.builder(
                        itemCount: images.length,
                        controller: controller,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                print(index);
                                selectElearn(index);
                              },
                              child: Container());
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Favourite",
                        style: TextStyle(
                            fontSize: 30,
                            color: ColorConst.titel,
                            fontFamily: "Calibre-Semibold",
                            fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                        icon: Icon(Icons.more_horiz_outlined,
                            size: 40, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                          // color: Color(0xFFff6e6e)
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 6.0),
                          child: Center(
                            child: Text(
                              "Latest",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "9+ Stories",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            RouterClass.routerClass
                                .pushToSpecificScreenUsingWidget(
                                    DetailScreen());
                          },
                          child: Favourites(
                            title: "The Dreaming Moon",
                            imageUrl: "assets/images/image_02.jpg",
                          ),
                        ),
                        Favourites(
                          title: "Fallen In Love",
                          imageUrl: "assets/images/image_03.jpg",
                        ),
                        Favourites(
                          title: "Hounted Ground",
                          imageUrl: "assets/images/image_04.jpg",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Favourites extends StatelessWidget {
  String title;
  String imageUrl;
  Favourites({
    this.title,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 300,
          width: 300,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 10,
                top: 170,
                bottom: 15,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = [];

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: InkWell(
                onTap: () {
                  print('object');
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(3.0, 6.0),
                        blurRadius: 10.0)
                  ]),
                  child: InkWell(
                    onTap: () {
                      print('object');
                    },
                    child: AspectRatio(
                      aspectRatio: cardAspectRatio,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.asset(images[i], fit: BoxFit.cover),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  child: Text(title[i],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          fontFamily: "SF-Pro-Text-Regular")),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                // InkWell(
                                //   onTap: () {
                                //     print('object');
                                //   },
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(
                                //         left: 12.0, bottom: 12.0),
                                //     child: Container(
                                //       padding: EdgeInsets.symmetric(
                                //           horizontal: 22.0, vertical: 6.0),
                                //       decoration: BoxDecoration(
                                //           color: Colors.redAccent,
                                //           borderRadius:
                                //               BorderRadius.circular(20.0)),
                                //       child: Text("Read Later",
                                //           style:
                                //               TextStyle(color: Colors.white)),
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
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
