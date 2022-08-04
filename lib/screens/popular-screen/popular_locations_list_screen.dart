import 'package:flutter/material.dart';

import '../../shared/widgets/app_bar_widget.dart';
import '../../shared/widgets/stack_widget.dart';

class PopularLocationsListScreen extends StatelessWidget {
  final List<LocationStack> _locationCardList = [];
  PopularLocationsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("Popular Locations"),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(children: const [
          //PopularLocations(locationCardList: _locationCardList),
          //HomesGuestsLove(homeCardList: _homeCardList)
        ])),
      ),
    );
  }
}
