import 'section_title_widget.dart';
import 'package:flutter/material.dart';
import 'card_widget.dart';

class HomesGuestsLove extends StatelessWidget {
  const HomesGuestsLove({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        const SectionTitle(title: 'Homes guests love'),
        SizedBox(
            height: 316,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                SizedBox(width: 22),
                HomeCard(),
                SizedBox(width: 27),
                HomeCard(),
                SizedBox(width: 27),
                HomeCard(),
                SizedBox(width: 27),
                HomeCard()
              ],
            )),
      ],
    ));
  }
}
