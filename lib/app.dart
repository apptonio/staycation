import 'package:devcademy_flutter/router.dart';
import 'package:devcademy_flutter/screens/home-screen/home_screen.dart';
import 'package:devcademy_flutter/screens/my-bookings-screen/my_bookings_screen.dart';
import 'package:devcademy_flutter/screens/my-places-screen/my_places_screen.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

import 'screens/home-details-screen/home_details_screen.dart';
import 'screens/homes-screen/homes_guests_love_list_screen.dart';
import 'screens/popular-screen/popular_locations_list_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.myPlacesScreen,
        routes: {
          Routes.homeScreen: (context) => HomeScreen(),
          Routes.popularLocationsListScreen: (context) =>
              PopularLocationsListScreen(),
          Routes.homesGuestsLoveListScreen: (context) =>
              const HomesGuestsLoveListScreen(),
          Routes.homeDetailsScreen: (context) =>
              const HomeDetailsScreen(),
          Routes.myBookingsScreen: ((context) => const MyBookingsScreen()),
          Routes.myPlacesScreen:(context) => const MyPlacesScreen()
        },
        );
  }
}
