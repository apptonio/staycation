
import 'package:devcademy_flutter/shared/widgets/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../router.dart';
import './widgets/popular_locations.dart';
import './widgets/homes_guests_love.dart';
import '../../shared/widgets/app_bar.dart';
import 'widgets/section_title_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
            title: "Staycation", showBackIcon: false, showSearchIcon: true),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    createUser();
                  },
                  child: SectionTitle(
                      title: 'Popular locations',
                      route: Routes.popularLocationsListScreen),
                ),
                const PopularLocations(),
                SectionTitle(
                    title: 'Homes guests love',
                    route: Routes.homesGuestsLoveListScreen),
                const HomesGuestsLove()
              ],
            ),
          ),
        ),
        bottomNavigationBar: const MyBottomNav(
          index: 0,
        ));
  }
}

Future createUser() async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: 'mojmail@gmail.com',
      password: '12345678',
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
