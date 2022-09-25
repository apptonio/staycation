import 'package:devcademy_flutter/models/location.dart';
import 'package:devcademy_flutter/shared/widgets/square_image.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

class LocationStack extends StatelessWidget {
  const LocationStack({Key? key, required this.location}) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    final int locationProperties = location.properties;
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
            child: SquareImage(
              imageUrl: location.imageUrl,
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 16.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                location.locationName,
                style: textTheme.bodyText1!
                    .merge(TextStyle(color: ThemeColors.white)),
              ),
              Text(
                "$locationProperties properties",
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
