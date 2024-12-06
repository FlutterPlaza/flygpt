import 'dart:async';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flygpt_client/flygpt_client.dart';
import 'package:flygpt_flutter/routes/app_router.dart';
import 'package:flygpt_flutter/screens/sign_in/sign_in_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

var client = Client('http://$localhost:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager())
  ..connectivityMonitor = FlutterConnectivityMonitor();

final sessionManager = SessionManager(caller: client.modules.auth);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await sessionManager.initialize();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'FlyGPT',
      theme: FlexThemeData.light(
        textTheme: GoogleFonts.interTextTheme(),
        colors: FlexSchemeColor.from(primary: Colors.blueAccent),
        useMaterial3: true,
      ),
      routerConfig: appRouter.config(),
    );
  }
}
