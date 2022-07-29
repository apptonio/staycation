import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, this.title = ''}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: ListTile(
          title: Text(
            title,
            style: textTheme.headline5,
          ),
          trailing: TextButton(
            onPressed: () {},
            child: Text("VIEW MORE",
                style: textTheme.button!
                    .merge(TextStyle(color: ThemeColors.mint400))),
          ),
        ));
  }
}
