import 'package:flutter/material.dart';

import '../../http.dart';
import '../../models/location.dart';
import '../../shared/widgets/app_bar_widget.dart';
import '../../shared/widgets/stack_widget.dart';
import '../../theme.dart';

class PopularLocationsListScreen extends StatelessWidget {
  final List<LocationStack> _locationCardList = [];
  PopularLocationsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("Popular Locations", true, false),
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

                  for (var location in locations) {
                    _locationCardList.add(LocationStack(
                      id: location.id,
                      locationName: location.locationName,
                      imageUrl: location.imageUrl,
                      properties: location.properties,
                      postalCode: location.postalCode,
                    ));
                  }

                  return GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: _locationCardList,
                  );
                })),
      ),
    );
  }
}
