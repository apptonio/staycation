import 'package:flutter/material.dart';

import '../../http.dart';
import '../../models/location.dart';
import '../../router.dart';
import '../../shared/widgets/app_bar.dart';
import '../../shared/widgets/location_stack.dart';
import '../../theme.dart';

class PopularLocationsListScreen extends StatelessWidget {
  const PopularLocationsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Popular Locations", showBackIcon: true, showSearchIcon: true),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 12.0),
          child: FutureBuilder(
              future: http.getAllLocations(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('error'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: ThemeColors.mint500,
                  ));
                }
                List<Location> locations = snapshot.data;

                return GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      ...locations
                          .map((location) => GestureDetector(
                              onTap: () => router.toLocationHomesScreen(
                                  context, location),
                              child: LocationStack(
                                location: location,
                              )))
                          .toList(),
                    ]);
              }),
        ),
      ),
    );
  }
}
