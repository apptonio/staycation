import 'package:devcademy_flutter/shared/widgets/accommodation_info.dart';
import 'package:devcademy_flutter/shared/widgets/rectangle_image.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
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
        child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RectangleImage(imageUrl: imageUrl),
                const SizedBox(height: 8),
                AccommodationInfo(
                    title: title,
                    location: location,
                    price: price,
                    categorization: categorization)
              ],
            ))));
  }
}
