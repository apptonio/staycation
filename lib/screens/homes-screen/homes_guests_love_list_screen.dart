import 'package:devcademy_flutter/models/accommodation.dart';
import 'package:devcademy_flutter/providers/homes_guests_love_arguments.dart';
import 'package:devcademy_flutter/providers/location_filter_arguments.dart';
import 'package:devcademy_flutter/shared/widgets/horizontal_card.dart';
import 'package:devcademy_flutter/shared/widgets/accommodation_info.dart';
import 'package:devcademy_flutter/shared/widgets/price_info.dart';
import 'package:flutter/material.dart';
import '../../http.dart';
import '../../models/location.dart';
import '../../router.dart';
import '../../shared/widgets/app_bar.dart';
import '../../theme.dart';

class HomesGuestsLoveListScreen extends StatelessWidget {
  const HomesGuestsLoveListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? filter;
    Location? filter2;

    if (ModalRoute.of(context)!.settings.arguments
        is HomesGuestsLoveListScreenArgumments) {
      HomesGuestsLoveListScreenArgumments? argumments = ModalRoute.of(context)!
          .settings
          .arguments as HomesGuestsLoveListScreenArgumments;

      filter = argumments.filter;
    }

    if (ModalRoute.of(context)!.settings.arguments is LocationFilterArguments) {
      LocationFilterArguments? locationFilter = ModalRoute?.of(context)
          ?.settings
          .arguments as LocationFilterArguments?;

      filter2 = locationFilter?.location;
    }

    return Scaffold(
        appBar: MyAppBar(
          title: "Homes Guests Love",
          showBackIcon: true,
          showSearchIcon: true,
        ),
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

                      if (filter != null) {
                        accommodations = accommodations
                            .where((element) => element.title
                                .toLowerCase()
                                .contains(filter!.toLowerCase()))
                            .toList();
                      }

                      if (filter2 != null) {
                        accommodations = accommodations
                            .where((element) => element.location == filter2?.locationName)
                            .toList();
                      }

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
                                  accommodation: accommodation,
                                  typeOfInfo: AccommodationInfo(
                                      categorization:
                                          accommodation.categorization,
                                      title: accommodation.title,
                                      location: accommodation.location,
                                      specialData: Price(
                                        price: accommodation.price,
                                      )),
                                ));
                          });
                    }))));
  }
}
