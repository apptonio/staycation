import 'package:devcademy_flutter/models/accommodation.dart';
import 'package:devcademy_flutter/screens/homes-screen/widgets/horizontal_card_widget.dart';
import 'package:flutter/material.dart';

import '../../http.dart';
import '../../shared/widgets/app_bar_widget.dart';
import '../../theme.dart';

class HomesGuestsLoveListScreen extends StatelessWidget {
  final List<HorizontalCard> _horizontalCardList = [];
  HomesGuestsLoveListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar("Homes Guests Love", true, true),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 12.0),
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
                      List<Accommodation> accomodations = snapshot.data;

                      for (var accomodation in accomodations) {
                        _horizontalCardList.add(HorizontalCard(
                          id: accomodation.id,
                          title: accomodation.title,
                          imageUrl: accomodation.imageUrl,
                          price: accomodation.price,
                          postalCode: accomodation.postalCode,
                          categorization: accomodation.categorization,
                          shortDescription: accomodation.shortDescription,
                          longDescription: accomodation.longDescription,
                          location: accomodation.location,
                          capacity: accomodation.capacity,
                          accommodationType: accomodation.accommodationType,
                          freeCancelation: accomodation.freeCancelation,
                        ));
                      }

                      return ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: _horizontalCardList,
                      );
                    }))));
  }
}
