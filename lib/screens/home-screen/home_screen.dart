import 'package:devcademy_flutter/shared/widgets/bottom_nav_widget.dart';
import 'package:flutter/material.dart';

import './widgets/popular_locations.dart';
import './widgets/homes_guests_love.dart';
import '../../shared/widgets/app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar("Staycation"),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                  children: const [PopularLocations(), HomesGuestsLove()])),
        ),
        bottomNavigationBar: const MyBottomNav());
  }
}
