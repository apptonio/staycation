import 'package:devcademy_flutter/router.dart';
import 'package:devcademy_flutter/screens/home-screen/home_screen.dart';
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
      initialRoute: Routes.homeScreen,
      routes: {
        Routes.homeScreen: (context) => HomeScreen(),
        Routes.popularLocationsListScreen: (context) =>
            PopularLocationsListScreen(),
        Routes.homesGuestsLoveListScreen: (context) =>
            HomesGuestsLoveListScreen(),
        Routes.homeDetailsScreen: (context) => const HomeDetailsScreen(
          id: '1',
          title: 'Split house',
          location: 'Split',
          imageUrl: 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/72282092.jpg?k=5eeba7eb191652ce0c0988b4c7c042f1165b7064d865b096bb48b8c48bf191b9&o=&hp=1',
          price: 200,
          categorization: 4,
          longDescription: 'This property is 1 minute walk from the beach.25 m away from the town\'s sandy beaches. It has a sun terrace and offers air-conditioned apartments with balconies and views of the Adriatic Sea.Apartments feature a living area with a flat-screen TV and satellite channels. They are bright and come equipped with free Wi-Fi and a modern kitchen with a dining area.The villa is a 5-minute walk from bars and restaurants offering fresh seafood. Historical monuments are only 3 km away.',
          shortDescription: 'This property is 3 minutes walk from the beach. Set in a traditional stone house with wooden ceiling beams, Apartment Natalia Old Town offers accommodation in Split, 400 m from Cathedral of St. Domnius and 500 m from Diocletian\'s Palace . Free private parking and free WiFi access are offered.',
          capacity: 4,
          postalCode: '21000',
          freeCancelation: true,
          accommodationType: 'apartment',
        ),
        // I put the data in this way, later on it will be handled by apartment ID's on the apartment click.
      },
    );
  }
}
