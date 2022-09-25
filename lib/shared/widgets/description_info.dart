import 'package:flutter/material.dart';

import '../../theme.dart';

class DescriptionInfo extends StatelessWidget {
  final String description;
  const DescriptionInfo({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: textTheme.bodyText2!.merge(
          TextStyle(color: ThemeColors.teal800, fontWeight: FontWeight.bold)),
    );
  }
}
