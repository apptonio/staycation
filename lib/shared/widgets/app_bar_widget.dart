import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:devcademy_flutter/assets.dart';
import 'package:devcademy_flutter/theme.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;

  MyAppBar(this.title, {Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: textTheme.headline6!
              .merge(TextStyle(color: ThemeColors.teal800))),
      actions: [
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset(Assets.icons.search)),
        IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.icons.more))
      ],
      backgroundColor: ThemeColors.white,
      foregroundColor: ThemeColors.teal800,
      elevation: 1,
    );
  }
}
