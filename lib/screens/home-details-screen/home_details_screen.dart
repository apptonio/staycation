import 'package:devcademy_flutter/screens/home-details-screen/widgets/book_button.dart';
import 'package:devcademy_flutter/screens/home-details-screen/widgets/details_sheet.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen(
      {Key? key,
      required this.id,
      required this.imageUrl,
      required this.title,
      required this.shortDescription,
      required this.longDescription,
      required this.location,
      required this.postalCode,
      required this.price,
      required this.categorization,
      required this.capacity,
      required this.accommodationType,
      required this.freeCancelation})
      : super(key: key);

  final String id;
  final String imageUrl;
  final String title;
  final String shortDescription;
  final String longDescription;
  final String location;
  final String postalCode;
  final int price;
  final int categorization;
  final int capacity;
  final String accommodationType;
  final bool freeCancelation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
      child: Stack(
        children: [
              Image.network(
                imageUrl,
                width: double.infinity,
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 0, 0),
                  child: SvgPicture.asset(
                    Assets.icons.back,
                    color: ThemeColors.teal800,
                  )),
              DetailsSheet(
                  id: id,
                  title: title,
                  shortDescription: shortDescription,
                  longDescription: longDescription,
                  location: location,
                  postalCode: postalCode,
                  price: price,
                  categorization: categorization,
                  capacity: capacity,
                  accommodationType: accommodationType,
                  freeCancelation: freeCancelation),
              const Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: BookButton())
            ],  
      ),
    )));
  }
}
