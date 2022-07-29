import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

import './widgets/popular_locations.dart';
import './widgets/homes_guests_love.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staycation'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more))
        ],
        backgroundColor: Colors.white,
        foregroundColor: ThemeColors.teal800,
        elevation: 1,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
                children: const [PopularLocations(), HomesGuestsLove()])),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.teal),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'My Bookings',
              backgroundColor: Colors.teal),
          BottomNavigationBarItem(
              icon: Icon(Icons.place),
              label: 'My Places',
              backgroundColor: Colors.teal)
        ],
        currentIndex: 0,
        selectedItemColor: Colors.teal,
      ),
    );
  }
}
