// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:flygpt_client/flygpt_client.dart' as _i6;
import 'package:flygpt_flutter/screens/chat/new_chat/chat_screen.dart' as _i1;
import 'package:flygpt_flutter/screens/dashboard/dashboard.dart' as _i2;
import 'package:flygpt_flutter/screens/sign_in/sign_in_page.dart' as _i3;

/// generated route for
/// [_i1.ChatScreen]
class ChatRoute extends _i4.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    _i5.Key? key,
    _i6.History? history,
    bool showAppBar = true,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(
            key: key,
            history: history,
            showAppBar: showAppBar,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<ChatRouteArgs>(orElse: () => const ChatRouteArgs());
      return _i1.ChatScreen(
        key: args.key,
        history: args.history,
        showAppBar: args.showAppBar,
      );
    },
  );
}

class ChatRouteArgs {
  const ChatRouteArgs({
    this.key,
    this.history,
    this.showAppBar = true,
  });

  final _i5.Key? key;

  final _i6.History? history;

  final bool showAppBar;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, history: $history, showAppBar: $showAppBar}';
  }
}

/// generated route for
/// [_i2.DashboardScreen]
class DashboardRoute extends _i4.PageRouteInfo<void> {
  const DashboardRoute({List<_i4.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i3.SignInPage]
class SignInRoute extends _i4.PageRouteInfo<void> {
  const SignInRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SignInPage();
    },
  );
}
