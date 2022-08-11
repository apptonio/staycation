import 'package:devcademy_flutter/models/accommodation.dart';
import 'package:devcademy_flutter/shared/widgets/square_image.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/accommodation_info.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({
    Key? key,
    required this.accommodation,
    required this.typeOfInfo,
  }) : super(key: key);

  final Accommodation accommodation;
  final Widget typeOfInfo;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        SquareImage(imageUrl: accommodation.imageUrl),
        typeOfInfo
      ],
    ));
  }
}
