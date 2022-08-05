import 'package:devcademy_flutter/screens/home-details-screen/widgets/details_sheet.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen(
      {Key? key,
      required this.id,
      required this.imageUrl,
      required this.title,
      required this.shortDescription,
      required this.longDescription,
      required this.location,
      required this.postalCode,
      required this.price,
      required this.categorization,
      required this.capacity,
      required this.accommodationType,
      required this.freeCancelation})
      : super(key: key);

  final String id;
  final String imageUrl;
  final String title;
  final String shortDescription;
  final String longDescription;
  final String location;
  final String postalCode;
  final int price;
  final int categorization;
  final int capacity;
  final String accommodationType;
  final bool freeCancelation;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Column(
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
          ),
          
          DetailsSheet(id: id, title: title, shortDescription: shortDescription, longDescription: longDescription, location: location, postalCode: postalCode, price: price, categorization: categorization, capacity: capacity, accommodationType: accommodationType, freeCancelation: freeCancelation),

          SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 42.0,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("BOOK YOUR STAY",
                          style: textTheme.button
                              ?.merge(TextStyle(color: ThemeColors.white))),
                    ),
                  ))),
        ],
      ),
    ));
  }
}
