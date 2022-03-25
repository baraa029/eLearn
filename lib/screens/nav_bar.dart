import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/them_provider.dart';
import 'book/explore_screen.dart';
import 'book/view_all_screen.dart';
import 'courses/home_cours.dart';
import 'stories/home_page.dart';

class myApp extends StatelessWidget {
  // const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int indexpage = Provider.of<ThemeProvider>(context).index;

    selectpage() {
      if (indexpage == 0) {
        return HomeCourses();
      } else if (indexpage == 1) {
        return ExploreScreen();
      } else if (indexpage == 2) {
        return ViewAllScreen();
      } else {
        return HomePage();
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
              borderRadius: 20,
              onTap: (value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .changcolor(value);
                Provider.of<ThemeProvider>(context, listen: false)
                    .changeindex(value);
              },
              currentIndex: Provider.of<ThemeProvider>(context).index,
              items: [
                FloatingNavbarItem(icon: Icons.home, title: 'Home'),
                FloatingNavbarItem(icon: Icons.explore, title: 'Explore'),
                FloatingNavbarItem(icon: Icons.home, title: 'Home'),
                FloatingNavbarItem(
                    icon: Icons.chat_bubble_outline, title: 'Chats'),
                FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
              ],
            ),
          ],
        )
      ],
    ));
  }
}
