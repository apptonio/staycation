import 'package:devcademy_flutter/assets.dart';
import 'package:devcademy_flutter/http.dart';
import 'package:devcademy_flutter/router.dart';
import 'package:devcademy_flutter/shared/widgets/accommodation_info.dart';
import 'package:devcademy_flutter/shared/widgets/bottom_nav.dart';
import 'package:devcademy_flutter/shared/widgets/description_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/accommodation.dart';
import '../../shared/widgets/app_bar.dart';
import '../../theme.dart';
import '../../shared/widgets/horizontal_card.dart';

class MyPlacesScreen extends StatelessWidget {
  const MyPlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
            title: "My Places", showBackIcon: false, showSearchIcon: false),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Stack(children: [
          SingleChildScrollView(
              child: FutureBuilder(
                  future: http.getMyPlaces(),
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

                          if (accommodations.isNotEmpty) {
                            return Dismissible(
                                key: Key(accommodations[index].toString()),
                                onDismissed: (direction) => {
                                      accommodations.removeAt(index),
                                      http.deletePlace(accommodation.id),
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            'Deleted ${accommodation.title} listing!'),
                                        behavior: SnackBarBehavior.floating,
                                        margin: const EdgeInsets.all(20.0),
                                      ))
                                    },
                                background: Container(
                                  padding: const EdgeInsets.only(right: 40),
                                  color: ThemeColors.red500,
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: SvgPicture.asset(
                                          Assets.icons.delete,
                                          color: ThemeColors.white)),
                                ),
                                child: GestureDetector(
                                    onTap: () => {
                                      router.toEditNewListingScreen(context, accommodation)
                                    },
                                    child: HorizontalCard(
                                        accommodation: accommodation,
                                        typeOfInfo: AccommodationInfo(
                                          title: accommodation.title,
                                          location: accommodation.location,
                                          categorization:
                                              accommodation.categorization,
                                          specialData: const DescriptionInfo(
                                              description:
                                                  "Renting the entire unit"),
                                        ))));
                          } else {
                            return const Center(
                              child: Text('You have no places!'),
                            );
                          }
                        });
                  })),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20.0, 20.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    backgroundColor: ThemeColors.mint400,
                    child: SvgPicture.asset(
                      Assets.icons.add,
                      color: ThemeColors.white,
                    ),
                    onPressed: () =>
                        router.navigateTo(context, Routes.newPlaceScreen),
                  )))
        ])),
        bottomNavigationBar: const MyBottomNav(index: 2));
  }
}
