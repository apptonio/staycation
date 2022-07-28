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
        Image.asset(Assets.images.tokyo),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 16.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [Text('London', style: TextStyle(color: Colors.white),), Text('5102 properties', style: TextStyle(color: Colors.white),)],
          ),
        )
      ],
    )));
  }
}
