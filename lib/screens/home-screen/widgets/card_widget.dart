import 'package:flutter/material.dart';

import '../../../assets.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Center(
        child: SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // I found it easier to add SizedBoxes, instead of padding
                Image.asset(Assets.images.sugar),
                const SizedBox(height: 10),
                const Text('Sugar & Spice Apartments',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 10),
                const Text(
                  'Split',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 10),
                const Text(
                  'EUR 75',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Image.asset(Assets.images.rating),
              ],
            ))));
  }
}
