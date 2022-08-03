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
            padding: const EdgeInsets.only(right: 28.0),
            child: SizedBox(
                width: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(imageUrl,
                            height: 154.0, width: 187.0, fit: BoxFit.cover)),
                    const SizedBox(height: 8),
                    Text(title,
                        style: textTheme.bodyText1!.merge(const TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ))),
                    const SizedBox(height: 10),
                    Text(
                      location,
                      style: textTheme.bodyText2!.merge(TextStyle(
                        color: ThemeColors.gray300,
                      )),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'EUR $price',
                      style: textTheme.bodyText1!.merge(TextStyle(
                        color: ThemeColors.teal800,
                      )),
                    ),
                    const SizedBox(height: 16),
                    StarsBar(categorization: categorization)
                  ],
                )))));
  }
}
