import 'package:flutter/material.dart';

class Routes {
  static String homeScreen = 'homeScreen';
  static String popularLocationsListScreen = 'popularLocationsListScreen';
  static String homesGuestsLoveListScreen = 'homesGuestsLoveListScreen';
  static String homeDetailsScreen = 'homeDetailsScreen';
}

class Router {
  void goBack(BuildContext context){
    return Navigator.pop(context);
  }

  Future<void> navigateTo(BuildContext context, String route) {
    return Navigator.pushNamed(context, route);
  }
}

Router router = Router();
