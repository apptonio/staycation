import 'package:flutter/material.dart';

class RectangleImage extends StatelessWidget {
  final String imageUrl;
  const RectangleImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Image.network(imageUrl,
            height: 154.0, width: 187.0, fit: BoxFit.cover));
  }
}
