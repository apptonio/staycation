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
          foregroundDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0x4d000000),
                Color(0x00FFFFFF),
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
