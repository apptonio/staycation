import 'package:flutter/material.dart';
import './section_title_widget.dart';
import './stack_widget.dart';

class PopularLocations extends StatelessWidget {
  const PopularLocations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        const SectionTitle(title: 'Popular locations'),
        SizedBox(
          height: 370,
          child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(8.0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: const [
              LocationStack(),
              LocationStack(),
              LocationStack(),
              LocationStack()
            ],
          ),
        )
      ],
    ));
  }
}
