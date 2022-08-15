import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../assets.dart';

class StarsBar extends StatelessWidget {
  final int categorization;
  const StarsBar({required this.categorization, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List<Widget>.generate(
          categorization,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: SvgPicture.asset(Assets.icons.star),
          ),
        )
      ],
    );
  }
}
