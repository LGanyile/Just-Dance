import 'package:flutter/material.dart';

import 'models/dance/rhythm.dart';
import 'models/dance/track.dart';
import 'screens/dance screens/dance_creation_ui.dart';
import 'screens/dance screens/staggered_animation.dart';
import 'screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Just Dance',
      home: StartScreen(),
    );
  }
}
