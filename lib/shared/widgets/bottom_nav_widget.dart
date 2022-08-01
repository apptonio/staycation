import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:devcademy_flutter/assets.dart';
import 'package:devcademy_flutter/theme.dart';

class MyBottomNav extends StatelessWidget {
  const MyBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      );
  }
}