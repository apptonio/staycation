import 'package:devcademy_flutter/models/location.dart';
import 'package:devcademy_flutter/providers/home_details_arguments.dart';
import 'package:devcademy_flutter/providers/homes_guests_love_arguments.dart';
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
  static String newPlaceScreen = 'newPlaceScreen';
  static String searchScreen = 'searchScreen';
  static String loginScreen = 'loginScreen';
}

class Router {
  void goBack(BuildContext context) {
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
      arguments: HomeDetailsArguments(accommodation: accommodation),
    );
  }

  Future<void> toLocationHomesScreen(BuildContext context, Location location) {
    return Navigator.pushNamed(
      context,
      Routes.homesGuestsLoveListScreen,
      arguments: LocationFilterArguments(location: location),
    );
  }

  Future<void> toEditNewListingScreen(
      BuildContext context, Accommodation accommodation) {
    return Navigator.pushNamed(
      context,
      Routes.newPlaceScreen,
      arguments: HomeDetailsArguments(accommodation: accommodation),
    );
  }

  Future<void> toHomesGuestsLoveScreen(
      BuildContext context, HomesGuestsLoveListScreenArgumments searchParams) {
    return Navigator.pushNamed(
      context,
      Routes.homesGuestsLoveListScreen,
      arguments: searchParams,
    );
  }
}

Router router = Router();
