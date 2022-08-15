import 'package:devcademy_flutter/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:devcademy_flutter/assets.dart';
import 'package:devcademy_flutter/theme.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final bool showBackIcon;
  final bool showSearchIcon;

  MyAppBar({required this.title, required this.showBackIcon, required this.showSearchIcon, Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: showBackIcon ? 50 : 0,
      leading: Visibility(
          visible: showBackIcon ? true : false,
          child: IconButton(
              onPressed: () => router.goBack(context), icon: SvgPicture.asset(Assets.icons.back))),
      title: Text(title,
          style: textTheme.headline6!
              .merge(TextStyle(color: ThemeColors.teal800))),
      actions: [
        Visibility(
            visible: showSearchIcon ? true : false,
            child: IconButton(
                onPressed: () {}, icon: SvgPicture.asset(Assets.icons.search))),
        IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.icons.more))
      ],
      backgroundColor: ThemeColors.white,
      foregroundColor: ThemeColors.teal800,
      elevation: 1,
    );
  }
}
