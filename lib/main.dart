import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_track/router/router.dart';
import 'package:learning_track/screens/SplashScreen/splash_ui.dart';
import 'package:provider/provider.dart';
import 'provider/them_provider.dart';

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
          navigatorKey: RouterClass.routerClass.navKey,
          theme: ThemeData(
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.transparent)),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      )));
}
