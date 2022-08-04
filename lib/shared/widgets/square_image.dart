import 'package:flutter/material.dart';

class SquareImage extends StatelessWidget {
  final String imageUrl;

  const SquareImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
              
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                )),
              ),
            );
  }
}