import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:devcademy_flutter/assets.dart';
import 'package:devcademy_flutter/theme.dart';

import '../../router.dart';

class MyBottomNav extends StatelessWidget {
  final int index;
  const MyBottomNav({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.icons.home,
            color: index == 0 ? ThemeColors.mint500 : ThemeColors.gray500,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.list, color: index == 1 ? ThemeColors.mint500 : ThemeColors.gray500,), label: 'My Bookings'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.places, color: index == 2 ? ThemeColors.mint500 : ThemeColors.gray500,), label: 'My Places'),
      ],
      selectedItemColor: ThemeColors.mint500,
      unselectedItemColor: ThemeColors.gray500,
      // doesn't work for some reason so I had to use Bools
      //selectedIconTheme: IconThemeData(color: ThemeColors.mint500),
      onTap: (int curr) {
        if (index == curr) {
        } else {
          switch (curr) {
            case 0:
              router.navigateTo(context, Routes.homeScreen);
              break;
            case 1:
              router.navigateTo(context, Routes.myBookingsScreen);
              break;
            case 2:
              router.navigateTo(context, Routes.myPlacesScreen);
              break;
            default:
              break;
          }
        }
      },
      currentIndex: index,
    );
  }
}
