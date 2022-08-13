import 'package:devcademy_flutter/models/accommodation.dart';
import 'package:devcademy_flutter/providers/home_details_arguments.dart';
import 'package:devcademy_flutter/screens/home-details-screen/widgets/book_button.dart';
import 'package:devcademy_flutter/screens/home-details-screen/widgets/details_sheet.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets.dart';
import '../../router.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeDetailsArguments arguments =
        ModalRoute.of(context)!.settings.arguments as HomeDetailsArguments;
    Accommodation accommodation = arguments.accommodation;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
      child: Stack(
        children: [
          Image.network(
            accommodation.imageUrl,
            width: double.infinity,
          ),
          GestureDetector(
              onTap: () => router.goBack(context),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 0, 0),
                  child: SvgPicture.asset(
                    Assets.icons.back,
                    color: ThemeColors.teal800,
                  ))),
          DetailsSheet(
              id: accommodation.id,
              title: accommodation.title,
              shortDescription: accommodation.shortDescription,
              longDescription: accommodation.longDescription,
              location: accommodation.location,
              postalCode: accommodation.postalCode,
              price: accommodation.price,
              categorization: accommodation.categorization,
              capacity: accommodation.capacity,
              accommodationType: accommodation.accommodationType,
              freeCancelation: accommodation.freeCancelation),
          const Align(
              alignment: AlignmentDirectional.bottomCenter, child: BookButton())
        ],
      ),
    )));
  }
}
