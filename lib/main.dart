import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_track/screens/book/home_screen.dart';
import 'package:learning_track/screens/courses/home_cours.dart';
import 'package:learning_track/screens/detail_screen.dart';
import 'package:learning_track/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:rounded_tabbar_widget/rounded_tabbar_widget.dart';

import 'provider/them_provider.dart';
import 'screens/courses/details_screen_cours.dart';

void main() {
  ///////// Tareq elaila
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([
    SystemUiOverlay.top,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    // DeviceOrientation.landscapeLeft,
    // DeviceOrientation.landscapeRight
  ]).then((value) => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(
            create: (context) {
              return ThemeProvider();
            },
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.transparent)),
          debugShowCheckedModeBanner: false,
          home: myApp(),
        ),
      )));
}

class myApp extends StatelessWidget {
  // const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int indexpage = Provider.of<ThemeProvider>(context).index;

    selectpage() {
      if (indexpage == 0) {
        return HomeCourses();
      } else if (indexpage == 1) {
        return HomeScreen();
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
