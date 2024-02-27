import 'package:flutter/material.dart';

import 'package:sample_design/home.dart';
import 'package:sample_design/print.dart';
import 'package:sample_design/printing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Demo App",
        routes: {
          '/home': (context) => home(),
          '/print': (context) => printer(),
        },
        initialRoute: '/',
        home: home());
  }
}
