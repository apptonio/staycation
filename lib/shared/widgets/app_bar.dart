import 'package:devcademy_flutter/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final auth = FirebaseAuth.instance;

  MyAppBar(
      {required this.title,
      required this.showBackIcon,
      required this.showSearchIcon,
      Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: showBackIcon ? 50 : 0,
      leading: Visibility(
          visible: showBackIcon ? true : false,
          child: IconButton(
              onPressed: () => router.goBack(context),
              icon: SvgPicture.asset(Assets.icons.back))),
      title: Text(title,
          style: textTheme.headline6!
              .merge(TextStyle(color: ThemeColors.teal800))),
      actions: [
        Visibility(
            visible: showSearchIcon ? true : false,
            child: IconButton(
                onPressed: () {
                  router.navigateTo(context, Routes.searchScreen);
                },
                icon: SvgPicture.asset(Assets.icons.search))),
        PopupMenuButton(
            icon: SvgPicture.asset(Assets.icons.more),
            offset: const Offset(0, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            itemBuilder: ((context) => [
                  PopupMenuItem(
                    value: 'logout',
                    child: ListTile(
                      title: const Text('Logout'),
                      trailing: SvgPicture.asset(Assets.icons.logout),
                    ),
                  )
                ]),
            onSelected: ((value) {
              auth.signOut().then((_) {
                router.navigateTo(context, Routes.loginScreen);
              }).catchError((_) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Error has occured while logging you out.'),
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.all(20.0),
                ));
              });
            }))
      ],
      backgroundColor: ThemeColors.white,
      foregroundColor: ThemeColors.teal800,
      elevation: 1,
    );
  }
}
