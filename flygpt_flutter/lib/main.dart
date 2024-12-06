import 'dart:async';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flygpt_client/flygpt_client.dart';
import 'package:flygpt_flutter/screens/sign_in/sign_in_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

var client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlyGPT',
      theme: FlexThemeData.light(
        textTheme: GoogleFonts.interTextTheme(),
        colors: FlexSchemeColor.from(primary: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: Text('FlyGPT'),
        ),
      ),
    );
  }
}
