import 'package:flutter/material.dart';
import './section_title_widget.dart';
import './stack_widget.dart';

class PopularLocations extends StatelessWidget {
  const PopularLocations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        const SectionTitle(),
        SizedBox(
          height: 400,
          child: GridView.count(
          crossAxisCount: 2,
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
