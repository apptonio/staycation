import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../theme.dart';
import 'stars_bar_widget.dart';

class BookingsInfo extends StatelessWidget {
  final String title;
  final String location;
  final DateTime checkIn;
  final DateTime checkOut;
  final int categorization;

  const BookingsInfo(
      {Key? key,
      required this.title,
      required this.location,
      required this.checkIn,
      required this.checkOut,
      required this.categorization})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String formattedCheckIn = DateFormat('MMMd').format(checkIn);
    final String formattedCheckOut = DateFormat('yMMMd').format(checkOut);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          '$formattedCheckIn - $formattedCheckOut',
          style: textTheme.bodyText2!.merge(TextStyle(
              color: ThemeColors.teal800, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 16),
        StarsBar(categorization: categorization)
      ],
    );
  }
}
