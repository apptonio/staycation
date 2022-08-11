import 'package:devcademy_flutter/shared/widgets/bottom_nav_widget.dart';
import 'package:flutter/material.dart';

import '../../router.dart';
import '../../shared/widgets/app_bar_widget.dart';

class MyPlacesScreen extends StatelessWidget {
  const MyPlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar("My Places", false, false),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container()
        ),
        bottomNavigationBar: const MyBottomNav());
  }
}
