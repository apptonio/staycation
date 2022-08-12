import 'package:devcademy_flutter/models/location.dart';
import 'package:devcademy_flutter/providers/home_details_arguments.dart';
import 'package:flutter/material.dart';

import 'models/accommodation.dart';
import 'providers/location_filter_arguments.dart';

class Routes {
  static String homeScreen = 'homeScreen';
  static String popularLocationsListScreen = 'popularLocationsListScreen';
  static String homesGuestsLoveListScreen = 'homesGuestsLoveListScreen';
  static String homeDetailsScreen = 'homeDetailsScreen';
  static String myBookingsScreen = 'MyBookingsScreen';
  static String myPlacesScreen = 'myPlacesScreen';
}

class Router {
  void goBack(BuildContext context){
    return Navigator.pop(context);
  }

  Future<void> navigateTo(BuildContext context, String route) {
    return Navigator.pushNamed(context, route);
  }

  Future<void> toAccommodationDetailsScreen(
      BuildContext context, Accommodation accommodation) {
    return Navigator.pushNamed(
      context,
      Routes.homeDetailsScreen,
      arguments:
          HomeDetailsArguments(accommodation: accommodation),
    );
  }

  Future<void> toLocationHomesScreen(
      BuildContext context, Location location) {
    return Navigator.pushNamed(
      context,
      Routes.homesGuestsLoveListScreen,
      arguments:
          LocationFilterArguments(location: location),
    );
  }
}

Router router = Router();
