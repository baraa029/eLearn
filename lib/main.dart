import 'package:firebase_core/firebase_core.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_track/router/router.dart';
import 'package:learning_track/screens/SplashScreen/splash_ui.dart';
import 'package:learning_track/screens/book/home_screen.dart';
import 'package:learning_track/screens/nav_bar.dart';
import 'package:learning_track/screens/view_all_screen.dart';
import 'package:learning_track/screens/courses/home_cours.dart';
import 'package:learning_track/screens/drawer.dart';
import 'package:learning_track/screens/pdf_Screen.dart';
import 'package:learning_track/screens/webviwe.dart';
import 'package:learning_track/test.dart';
import 'package:provider/provider.dart';
import 'package:rounded_tabbar_widget/rounded_tabbar_widget.dart';

import 'provider/auth_provider.dart';
import 'provider/firestore_provider.dart';
import 'provider/them_provider.dart';
import 'screens/courses/details_screen_cours.dart';

Future<void> main() async {
  ///////// Tareq elaila
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
          ChangeNotifierProvider<AuthProvider>(
            create: (context) {
              return AuthProvider();
            },
          ),
          ChangeNotifierProvider<FireProvider>(
            create: (context) {
              return FireProvider();
            },
          ),
        ],
        child: MaterialApp(
          navigatorKey: RouterClass.routerClass.navKey,
          theme: ThemeData(
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.transparent)),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      )));
}
