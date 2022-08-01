import 'package:devcademy_flutter/assets.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.home,
                color: ThemeColors.mint500,
              ),
              label: 'Home',
              backgroundColor: ThemeColors.mint500),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.icons.list),
              label: 'My Bookings',
              backgroundColor: ThemeColors.mint500),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.icons.places),
              label: 'My Places',
              backgroundColor: ThemeColors.mint500)
        ],
        currentIndex: 0,
        selectedItemColor: ThemeColors.mint500,
      ),
    );
  }
}
