import 'package:flutter/material.dart';

import '../../../theme.dart';

class BookButton extends StatelessWidget {
  const BookButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 42.0,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ThemeColors.mint400,
                ),
                onPressed: () {},
                child: Text("BOOK YOUR STAY",
                    style: textTheme.button
                        ?.merge(TextStyle(color: ThemeColors.white))),
              ),
            )));
  }
}
