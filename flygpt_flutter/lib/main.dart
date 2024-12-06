import 'dart:async';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flygpt_flutter/routes/app_router.dart';
import 'package:flygpt_flutter/routes/app_router.gr.dart';
import 'package:flygpt_flutter/screens/chat/chat_history_bloc/chat_history_bloc.dart';
import 'package:flygpt_flutter/server/client.dart';
import 'package:flygpt_flutter/shared/extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:universal_io/io.dart';
  PodClient podClient = PodClientFactory.getPodClient(Environment.development);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await podClient.sessionManager.initialize();

  final appRouter = AppRouter();

  setOrientation().then((value) => runApp(RepositoryProvider<PodClient>(
    create: (context) => podClient,
    child: MyApp(
      appRouter: appRouter,
      podClient: podClient,
    ),
  )));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.appRouter, required this.podClient})
      : chatBloc = ChatHistoryBloc(podClient);

  final AppRouter appRouter;
  final PodClient podClient;
  final ChatHistoryBloc chatBloc;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        podClient.sessionManager.addListener(() async {
          final isSignedIn = podClient.sessionManager.isSignedIn;
          if (!isSignedIn) {
            appRouter.navigate(SignInRoute());
          } else if (isSignedIn && appRouter.current.name == SignInRoute.name) {
            appRouter.navigate(DashboardRoute());
          }
        });
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'FlyGPT',
          theme: FlexThemeData.light(
            textTheme: GoogleFonts.interTextTheme(),
            colors: FlexSchemeColor.from(primary: Colors.blueAccent),
            useMaterial3: true,
          ),
          routerConfig: appRouter.config(),
        ).and(chatBloc);
      },
    );
  }
}

Future<void> setOrientation() async {
  if (!kIsWeb && Platform.isAndroid && Platform.isIOS) {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
