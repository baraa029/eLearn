import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  Color settingscolor = Colors.grey;
  Color bookmarkcolor = Colors.white;
  Color home_filledcolor = Colors.grey;
  int index = 1;

  changeindex(int value) {
    index = value;
    notifyListeners();
  }

  changcolor(int select) {
    switch (select) {
      case 0:
        settingscolor = Colors.white;
        bookmarkcolor = Colors.grey;
        home_filledcolor = Colors.grey;
        notifyListeners();
        break;
      case 1:
        settingscolor = Colors.grey;
        bookmarkcolor = Colors.white;
        home_filledcolor = Colors.grey;
        notifyListeners();
        break;
      case 2:
        settingscolor = Colors.grey;
        bookmarkcolor = Colors.grey;
        home_filledcolor = Colors.white;
        notifyListeners();
        break;
    }
  }
}
