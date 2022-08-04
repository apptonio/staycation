import 'package:devcademy_flutter/shared/widgets/accommodation_info.dart';
import 'package:devcademy_flutter/shared/widgets/stars_bar_widget.dart';
import 'package:devcademy_flutter/theme.dart';
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
            child: SizedBox(
                width: 180,
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(imageUrl,
                            height: 154.0, width: 187.0, fit: BoxFit.cover)),
                    const SizedBox(height: 8),
                    AccommodationInfo(
                        title: title,
                        location: location,
                        price: price,
                        categorization: categorization)
                  ],
                )))));
  }
}
