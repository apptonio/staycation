import 'package:devcademy_flutter/models/accommodation.dart';
import 'package:devcademy_flutter/screens/homes-screen/widgets/horizontal_card_widget.dart';
import 'package:flutter/material.dart';

import '../../http.dart';
import '../../router.dart';
import '../../shared/widgets/app_bar_widget.dart';
import '../../theme.dart';

class HomesGuestsLoveListScreen extends StatelessWidget {
  const HomesGuestsLoveListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar("Homes Guests Love", true, true),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: SingleChildScrollView(
                child: FutureBuilder(
                    future: http.getAllHomes(),
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

                      return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          separatorBuilder: ((context, index) =>
                              const SizedBox(height: 20)),
                          itemCount: accommodations.length,
                          itemBuilder: (BuildContext context, index) {
                            Accommodation accommodation = accommodations[index];
                            return GestureDetector(
                                onTap: () =>
                                    router.toAccommodationDetailsScreen(
                                        context, accommodation),
                                child: HorizontalCard(
                                  id: accommodation.id,
                                  title: accommodation.title,
                                  imageUrl: accommodation.imageUrl,
                                  price: accommodation.price,
                                  postalCode: accommodation.postalCode,
                                  categorization: accommodation.categorization,
                                  shortDescription:
                                      accommodation.shortDescription,
                                  longDescription:
                                      accommodation.longDescription,
                                  location: accommodation.location,
                                  capacity: accommodation.capacity,
                                  accommodationType:
                                      accommodation.accommodationType,
                                  freeCancelation:
                                      accommodation.freeCancelation,
                                ));
                          });
                    }))));
  }
}
