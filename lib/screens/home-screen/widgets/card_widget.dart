import 'package:devcademy_flutter/shared/widgets/accommodation_info.dart';
import 'package:devcademy_flutter/shared/widgets/price_info.dart';
import 'package:devcademy_flutter/shared/widgets/rectangle_image.dart';
import 'package:flutter/material.dart';

import '../../../models/accommodation.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.accommodation}) : super(key: key);

  final Accommodation accommodation;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RectangleImage(imageUrl: accommodation.imageUrl),
                const SizedBox(height: 8),
                AccommodationInfo(
                    title: accommodation.title,
                    location: accommodation.location,
                    specialData: AccommodationPrice(price: accommodation.price),
                    categorization: accommodation.categorization)
              ],
            )));
  }
}
