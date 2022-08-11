import 'package:flutter/material.dart';

import '../../theme.dart';

class AccommodationPrice extends StatelessWidget {
  final int price;
  const AccommodationPrice({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'EUR $price',
      style: textTheme.bodyText1!.merge(TextStyle(
        color: ThemeColors.teal800,
      )),
    );
  }
}
