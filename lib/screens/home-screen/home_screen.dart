import 'package:devcademy_flutter/screens/home-screen/widgets/card_widget.dart';
import 'package:devcademy_flutter/shared/widgets/stack_widget.dart';
import 'package:devcademy_flutter/shared/widgets/bottom_nav_widget.dart';
import 'package:flutter/material.dart';

import './widgets/popular_locations.dart';
import './widgets/homes_guests_love.dart';
import '../../shared/widgets/app_bar_widget.dart';
import 'widgets/section_title_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<LocationStack> _locationCardList = [];
  final List<HomeCard> _homeCardList = [];
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar("Staycation", false, true),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
                const SectionTitle(title: 'Popular locations'),
            PopularLocations(locationCardList: _locationCardList),
            const SectionTitle(title: 'Homes guests love'),
            HomesGuestsLove(homeCardList: _homeCardList)
          ])),
        ),
        bottomNavigationBar: const MyBottomNav());
  }
}
