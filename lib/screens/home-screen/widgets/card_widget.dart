import 'package:devcademy_flutter/shared/widgets/stars_bar_widget.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

import '../../../assets.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Center(
        child: SizedBox(
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Assets.images.sugar),
                const SizedBox(height: 8),
                Text('Sugar & Spice Apartments',
                    style: textTheme.bodyText1!.merge(const TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ))),
                const SizedBox(height: 10),
                Text(
                  'Split',
                  style: textTheme.bodyText2!.merge(TextStyle(
                    color: ThemeColors.gray300,
                  )),
                ),
                const SizedBox(height: 10),
                Text(
                  'EUR 75',
                  style: textTheme.bodyText1!.merge(TextStyle(
                    color: ThemeColors.teal800,
                  )),
                ),
                const SizedBox(height: 16),
                const StarsBar(categorization: 5)
              ],
            ))));
  }
}
