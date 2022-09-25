import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme.dart';

class DateInfo extends StatelessWidget {
  final DateTime checkIn;
  final DateTime checkOut;
  const DateInfo({Key? key, required this.checkIn, required this.checkOut})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String formattedCheckIn = DateFormat('MMMd').format(checkIn);
    final String formattedCheckOut = DateFormat('yMMMd').format(checkOut);
    return Text(
      '$formattedCheckIn - $formattedCheckOut',
      style: textTheme.bodyText2!.merge(
          TextStyle(color: ThemeColors.teal800, fontWeight: FontWeight.bold)),
    );
  }
}
