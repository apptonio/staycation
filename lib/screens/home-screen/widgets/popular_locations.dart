import 'package:flutter/material.dart';
import '../../../http.dart';
import '../../../models/location.dart';
import '../../../theme.dart';
import '../../../shared/widgets/stack_widget.dart';

class PopularLocations extends StatelessWidget {
  const PopularLocations({
    Key? key,
    required List<LocationStack> locationCardList,
  })  : _locationCardList = locationCardList,
        super(key: key);

  final List<LocationStack> _locationCardList;

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
            padding: const EdgeInsets.all(20.0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: _locationCardList,
          );
        }));
  }
}
