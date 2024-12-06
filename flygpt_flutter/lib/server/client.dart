// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
import 'dart:io';

import 'package:flygpt_client/flygpt_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class Util {
  static String get ip {
    if (Platform.isAndroid) {
      return '192.168.1.109'; // Update with your Android local IP
    }
    if (Platform.isIOS) {
      return 'localhost'; // For iOS Simulator
    }
    return 'localhost'; // Default for other platforms
  }

  /// Method to determine the base URL based on the environment
  static String getBaseUrl(Environment environment) {
    switch (environment) {
      case Environment.development:
        return 'http://$ip:8080/'; // Local development
      case Environment.staging:
        return 'http://staging.example.com/'; // Replace with your staging URL
      case Environment.production:
        return 'https://yourdomain.com/'; // Replace with your production URL
      default:
        throw UnsupportedError('Unknown environment: $environment');
    }
  }
}

/// Enum to define different environments
enum Environment { development, staging, production }

// /// Select the current environment
// /// Update this value to switch between environments
// const Environment currentEnvironment = Environment.development;

abstract class PodClient {
  Client get client;
  SessionManager get sessionManager;
}

class _DevClient implements PodClient {
  _DevClient._internal();

  static final _DevClient _instance = _DevClient._internal();

  factory _DevClient() => _instance;

  Client? _client;
  SessionManager? _sessionManager;

  @override
  Client get client {
    return _client ??= Client(
      Util.getBaseUrl(Environment.development),
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor();
  }

  @override
  SessionManager get sessionManager {
    return _sessionManager ??= SessionManager(caller: client.modules.auth);
  }
}


// Staging Client
class _StagClient implements PodClient {
  _StagClient._internal();
  static final _StagClient _instance = _StagClient._internal();
  factory _StagClient() => _instance;

  Client? _client;
  SessionManager? _sessionManager;

  @override
  Client get client {
    return _client ??= Client(
      Util.getBaseUrl(Environment.staging),
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor();
  }

  @override
  SessionManager get sessionManager {
    return _sessionManager ??= SessionManager(caller: client.modules.auth);
  }
}

// Production Client
class _ProdClient implements PodClient {
  _ProdClient._internal();
  static final _ProdClient _instance = _ProdClient._internal();
  factory _ProdClient() => _instance;

  Client? _client;
  SessionManager? _sessionManager;

  @override
  Client get client {
    return _client ??= Client(
      Util.getBaseUrl(Environment.production),
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor();
  }

  @override
  SessionManager get sessionManager {
    return _sessionManager ??= SessionManager(caller: client.modules.auth);
  }
}


class PodClientFactory {
  static PodClient getPodClient(Environment currentEnv) {

    switch (currentEnv) {
      case Environment.development:
        return _DevClient();
      case Environment.staging:
        return _StagClient();
      case Environment.production:
        return _ProdClient();
      default:
        throw Exception('Unknown environment: $currentEnv');
    }
  }
}
