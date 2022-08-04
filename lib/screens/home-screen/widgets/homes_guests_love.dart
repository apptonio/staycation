import 'package:devcademy_flutter/models/accommodation.dart';

import '../../../http.dart';
import '../../../theme.dart';
import 'section_title_widget.dart';
import 'package:flutter/material.dart';
import 'card_widget.dart';

class HomesGuestsLove extends StatelessWidget {
  const HomesGuestsLove({
    Key? key,
    required List<HomeCard> homeCardList,
  })  : _homeCardList = homeCardList,
        super(key: key);

  final List<HomeCard> _homeCardList;

  @override
  Widget build(BuildContext context) {
    return (FutureBuilder(
        future: http.getHomesGuestsLove(),
        builder: (BuildContext context, AsyncSnapshot snapshot2) {
          if (snapshot2.hasError) {
            return const Center(child: Text('error'));
          }
          if (snapshot2.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: ThemeColors.mint500,
            ));
          }
          List<Accommodation> accomodations = snapshot2.data;

          for (var accomodation in accomodations) {
            _homeCardList.add(HomeCard(
              id: accomodation.id,
              imageUrl: accomodation.imageUrl,
              title: accomodation.title,
              shortDescription: accomodation.shortDescription,
              longDescription: accomodation.longDescription,
              location: accomodation.location,
              postalCode: accomodation.postalCode,
              price: accomodation.price,
              categorization: accomodation.categorization,
              capacity: accomodation.capacity,
              accommodationType: accomodation.accommodationType,
              freeCancelation: accomodation.freeCancelation,
            ));
          }

          return SizedBox(
              height: 316,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(24.0, 8.0, 0, 0),
                scrollDirection: Axis.horizontal,
                children: [..._homeCardList],
              ));
        }));
  }
}
