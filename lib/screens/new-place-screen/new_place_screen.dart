import 'package:devcademy_flutter/screens/new-place-screen/widgets/new_place_app_bar.dart';
import 'package:flutter/material.dart';

class NewPlaceScreen extends StatelessWidget {
  const NewPlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewPlaceAppBar(
          title: "Add new place",
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(),
        ));
  }
}
