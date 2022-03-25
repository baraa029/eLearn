import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouterClass {
  RouterClass._();
  static RouterClass route = RouterClass._();
  GlobalKey<NavigatorState> navkey = GlobalKey();

  // pushToSecificSccrrenByName(String screenNavigator) {
  //   navkey.currentState.pushNamed(screenNavigator);
  // }
  // Map<String, Widget Function(BuildContext)> map = {
  //   'screen1': (context) => Screen1(),
  //   'screen2': (context) => login(),
  // };

  //or

  pushToSecificSccrrenUsingWidget(Widget widget) {
    BuildContext context = navkey.currentContext;
    navkey.currentState.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  pushReplacementUsingWidget(Widget widget) {
    BuildContext context = navkey.currentContext;
    navkey.currentState.pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  popFunction() {
    navkey.currentState.pop();
  }
}
