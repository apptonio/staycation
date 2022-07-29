import 'package:flutter/material.dart';

import '../../../assets.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Center(
        child: Column(
      children: [
        Image.asset(Assets.images.sugar),
        const Text('Sugar & Spice Apartments', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), 
        const Text('Split', style: TextStyle(color: Colors.grey, fontSize: 14),),
        const Text('EUR 75', style: TextStyle(fontSize: 16),),
        Image.asset(Assets.images.rating),
      ],
    )));
  }
}