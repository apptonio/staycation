import 'package:devcademy_flutter/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:devcademy_flutter/assets.dart';
import 'package:devcademy_flutter/theme.dart';

class NewPlaceAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;

  NewPlaceAppBar({required this.title, Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 50,
      leading: IconButton(
          onPressed: () => router.goBack(context),
          icon: SvgPicture.asset(Assets.icons.close)),
      title: Text(title,
          style: textTheme.headline6!
              .merge(TextStyle(color: ThemeColors.teal800))),
      centerTitle: false,
      actions: [
        TextButton(
          onPressed: () => {
            // TO-DO: Saving
            router.navigateTo(context, Routes.myPlacesScreen),
          },
          child: Text("SAVE",
              style: textTheme.button!
                  .merge(TextStyle(color: ThemeColors.teal800))),
        ),
      ],
      backgroundColor: ThemeColors.white,
      foregroundColor: ThemeColors.teal800,
      elevation: 1,
    );
  }
}
