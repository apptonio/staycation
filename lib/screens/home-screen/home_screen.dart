import 'package:devcademy_flutter/shared/widgets/stack_widget.dart';
import 'package:devcademy_flutter/shared/widgets/bottom_nav_widget.dart';
import 'package:flutter/material.dart';

import '../../router.dart';
import './widgets/popular_locations.dart';
import './widgets/homes_guests_love.dart';
import '../../shared/widgets/app_bar_widget.dart';
import 'widgets/section_title_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<LocationStack> _locationCardList = [];
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar("Staycation", false, true),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
            SectionTitle(
                title: 'Popular locations',
                route: Routes.popularLocationsListScreen),
            PopularLocations(locationCardList: _locationCardList),
            SectionTitle(
                title: 'Homes guests love',
                route: Routes.homesGuestsLoveListScreen),
            const HomesGuestsLove()
          ])),
        ),
        bottomNavigationBar: const MyBottomNav());
  }
}
