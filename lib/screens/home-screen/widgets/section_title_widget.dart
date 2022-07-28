import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key,
  this.title = 'Title'}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: TextButton(
        onPressed: () {},
        child: const Text("READ MORE"),
      ),
    );
  }
}
