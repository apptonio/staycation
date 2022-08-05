import 'package:devcademy_flutter/shared/widgets/square_image.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

class LocationStack extends StatelessWidget {
  const LocationStack(
      {Key? key,
      required this.id,
      required this.locationName,
      required this.postalCode,
      required this.imageUrl,
      required this.properties})
      : super(key: key);

  final String id;
  final String locationName;
  final String postalCode;
  final String imageUrl;
  final int properties;

  @override
  Widget build(BuildContext context) {
    return (Center(
        child: Stack(
      children: [
        Container(
            foregroundDecoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ThemeColors.black.withOpacity(0.5),
                  ThemeColors.white.withOpacity(0),
                ],
              ),
            ),
            child: SquareImage(imageUrl: imageUrl,)),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 16.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                locationName,
                style: textTheme.bodyText1!
                    .merge(TextStyle(color: ThemeColors.white)),
              ),
              Text(
                "$properties properties",
                style: textTheme.bodyText2!
                    .merge(TextStyle(color: ThemeColors.white)),
              )
            ],
          ),
        )
      ],
    )));
  }
}
