import 'package:devcademy_flutter/shared/widgets/square_image.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/accommodation_info.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({
    Key? key,
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
    required this.freeCancelation,
  }) : super(key: key);

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
    return (Center(
        child: GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        SquareImage(imageUrl: imageUrl),
        AccommodationInfo(
            title: title,
            location: location,
            price: price,
            categorization: categorization)
      ],
    )));
  }
}
