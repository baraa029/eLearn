import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:learning_track/colorConst.dart';
import 'package:learning_track/screens/menu_Screen.dart';
import 'package:learning_track/screens/stories/home_page.dart';
import 'package:learning_track/screens/view_all_screen.dart';
import 'package:provider/provider.dart';

import '../provider/firestore_provider.dart';
import '../provider/them_provider.dart';
import 'book/explore_screen.dart';
import 'courses/home_cours.dart';

class myApp extends StatelessWidget {
  // const myApp({Key? key}) : super(key: key);
  int x = 0;
  firedata(BuildContext context) {
    if (x == 0) {
      Provider.of<FireProvider>(context).getAllcourse();
      Provider.of<FireProvider>(context).getAllbook();
      x = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    firedata(context);
    int indexpage = Provider.of<ThemeProvider>(context).index;

    selectpage() {
      if (indexpage == 0) {
        return HomeCourses();
      } else if (indexpage == 1) {
        return ExploreScreen();
      } else if (indexpage == 2) {
        return ViewAllScreen();
      } else if (indexpage == 3) {
        return HomePage();
      } else {
        return menuScreen();
      }
    }

    return Scaffold(
        body: Stack(
      children: [
        selectpage(),
        Column(
          children: [
            Spacer(),
            FloatingNavbar(
              backgroundColor: Color.fromARGB(255, 200, 97, 231),
              selectedItemColor: Colors.white,
              selectedBackgroundColor: Color.fromARGB(255, 255, 91, 79),
              borderRadius: 20,
              onTap: (value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .changcolor(value);
                Provider.of<ThemeProvider>(context, listen: false)
                    .changeindex(value);
              },
              currentIndex: Provider.of<ThemeProvider>(context).index,
              items: [
                FloatingNavbarItem(
                    customWidget: Image.asset(
                      'assets/icons/course.png',
                      height: 28,
                    ),
                    title: 'course'),
                FloatingNavbarItem(
                    customWidget: Image.asset(
                      'assets/icons/book.png',
                      height: 28,
                    ),
                    title: 'Stories'),
                FloatingNavbarItem(icon: Icons.home, title: 'Home'),
                FloatingNavbarItem(
                    customWidget: Image.asset(
                      'assets/icons/interactive.png',
                      height: 28,
                    ),
                    title: 'interactive'),
                FloatingNavbarItem(
                    customWidget: Image.asset(
                      'assets/icons/menus.png',
                      height: 28,
                    ),
                    title: 'menus'),
              ],
            ),
          ],
        )
      ],
    ));
  }
}
