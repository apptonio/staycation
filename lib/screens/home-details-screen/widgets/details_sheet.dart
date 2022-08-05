import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../assets.dart';
import '../../../shared/widgets/stars_bar_widget.dart';
import '../../../theme.dart';

class DetailsSheet extends StatelessWidget {
  const DetailsSheet(
      {Key? key,
      required this.id,
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
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.95,
      minChildSize: 0.7,
      builder: (context, scrollController) {
        return SingleChildScrollView(
            controller: scrollController,
            child: Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 1.0),
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  color: ThemeColors.white,
                ),
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Container(
                      color: ThemeColors.gray200,
                      width: 28,
                      height: 3,
                    )),
                    const SizedBox(height: 20.0),
                    Text(
                      title,
                      style: textTheme.headline6!
                          .merge(const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 12.0),
                    StarsBar(categorization: categorization),
                    const SizedBox(height: 12.0),
                    Text(shortDescription,
                        style: textTheme.bodyText2!.merge(TextStyle(
                            color: ThemeColors.gray500, height: 1.5))),
                    const SizedBox(height: 16.0),
                    Visibility(
                        visible: freeCancelation ? true : false,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Assets.icons.calendar,
                              color: ThemeColors.coral500,
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Text(
                              'Free cancellation available',
                              style: textTheme.bodyText2!.merge(TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ThemeColors.teal800)),
                            )
                          ],
                        )),
                    const SizedBox(height: 20.0),
                    Text(
                      longDescription,
                      style: textTheme.bodyText1!.merge(
                          TextStyle(height: 1.5, color: ThemeColors.teal800)),
                    ),
                    const SizedBox(height: 30.0),
                    Text(
                      'Property info:',
                      style: textTheme.bodyText1!
                          .merge(const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      '$capacity guests',
                      style: textTheme.bodyText1!
                          .merge(TextStyle(color: ThemeColors.teal800)),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      accommodationType,
                      style: textTheme.bodyText1!
                          .merge(TextStyle(color: ThemeColors.teal800)),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'EUR $price per night',
                      style: textTheme.bodyText1!
                          .merge(TextStyle(color: ThemeColors.teal800)),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      location,
                      style: textTheme.bodyText1!
                          .merge(TextStyle(color: ThemeColors.teal800)),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      postalCode,
                      style: textTheme.bodyText1!
                          .merge(TextStyle(color: ThemeColors.teal800)),
                    ),
                  ],
                )));
      },
    );
  }
}
