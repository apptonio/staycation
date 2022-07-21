import 'package:devcademy_flutter/router.dart';
import 'package:devcademy_flutter/screens/home-screen/home_screen.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeScreen,
      routes: {
        Routes.homeScreen: (context) => const HomeScreen(),
      },
    );
  }
}
