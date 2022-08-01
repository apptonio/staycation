import 'package:devcademy_flutter/assets.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

class LocationStack extends StatelessWidget {
  const LocationStack({Key? key}) : super(key: key);

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
                ThemeColors.black.withOpacity(0.3),
                ThemeColors.white.withOpacity(0),
              ],
            ),
          ),
          child: Image.asset(Assets.images.london),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 16.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'London',
                style: textTheme.bodyText1!
                    .merge(TextStyle(color: ThemeColors.white)),
              ),
              Text(
                '5102 properties',
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
