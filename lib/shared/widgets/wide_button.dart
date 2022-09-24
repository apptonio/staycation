import 'package:flutter/material.dart';

import '../../theme.dart';

class WideButton extends StatelessWidget {
  final String title;
  final VoidCallback action;
  const WideButton({Key? key, required this.title, required this.action})
      : super(key: key);

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
                  backgroundColor: ThemeColors.mint400,
                ),
                onPressed: action,
                child: Text(title,
                    style: textTheme.button
                        ?.merge(TextStyle(color: ThemeColors.white))),
              ),
            )));
  }
}
