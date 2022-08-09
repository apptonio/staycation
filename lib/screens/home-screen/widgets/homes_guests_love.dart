import 'package:devcademy_flutter/models/accommodation.dart';
import 'package:devcademy_flutter/router.dart';

import '../../../http.dart';
import '../../../theme.dart';
import 'package:flutter/material.dart';
import 'card_widget.dart';

class HomesGuestsLove extends StatelessWidget {
  const HomesGuestsLove({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (FutureBuilder(
        future: http.getHomesGuestsLove(),
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
          List<Accommodation> accommodations = snapshot.data;

          return SizedBox(height: 316, child: ListView.builder(
              itemCount: accommodations.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Accommodation accommodation = accommodations[index];
                return GestureDetector(
                    onTap: () => router.toAccommodationDetailsScreen(
                        context, accommodation),
                    child: HomeCard(
                      id: accommodation.id,
                      imageUrl: accommodation.imageUrl,
                      title: accommodation.title,
                      shortDescription: accommodation.shortDescription,
                      longDescription: accommodation.longDescription,
                      location: accommodation.location,
                      postalCode: accommodation.postalCode,
                      price: accommodation.price,
                      categorization: accommodation.categorization,
                      capacity: accommodation.capacity,
                      accommodationType: accommodation.accommodationType,
                      freeCancelation: accommodation.freeCancelation,
                    ));
              }));
        }));
  }
}
