import 'package:flutter/material.dart';
import '../../../http.dart';
import '../../../models/location.dart';
import '../../../router.dart';
import '../../../theme.dart';
import '../../../shared/widgets/location_stack.dart';

class PopularLocations extends StatelessWidget {
  const PopularLocations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (FutureBuilder(
        future: http.getPopularLocations(),
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
              padding: const EdgeInsets.all(20.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                ...locations
                    .map((location) => GestureDetector(
                        onTap: () =>
                            router.toLocationHomesScreen(context, location),
                        child: LocationStack(
                          location: location,
                        )))
                    .toList(),
              ]);
        }));
  }
}
