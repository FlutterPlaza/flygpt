/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/example_endpoint.dart' as _i2;
import '../endpoints/history_endpoint.dart' as _i3;
import 'package:flygpt_server/src/generated/history.dart' as _i4;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i5;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'example': _i2.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'history': _i3.HistoryEndpoint()
        ..initialize(
          server,
          'history',
          null,
        ),
    };
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i2.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['history'] = _i1.EndpointConnector(
      name: 'history',
      endpoint: endpoints['history']!,
      methodConnectors: {
        'createHistory': _i1.MethodConnector(
          name: 'createHistory',
          params: {
            'history': _i1.ParameterDescription(
              name: 'history',
              type: _i1.getType<_i4.History>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['history'] as _i3.HistoryEndpoint).createHistory(
            session,
            params['history'],
          ),
        ),
        'updateHistory': _i1.MethodConnector(
          name: 'updateHistory',
          params: {
            'history': _i1.ParameterDescription(
              name: 'history',
              type: _i1.getType<_i4.History>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['history'] as _i3.HistoryEndpoint).updateHistory(
            session,
            params['history'],
          ),
        ),
        'getAllHistory': _i1.MethodConnector(
          name: 'getAllHistory',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['history'] as _i3.HistoryEndpoint)
                  .getAllHistory(session),
        ),
        'deleteHistory': _i1.MethodConnector(
          name: 'deleteHistory',
          params: {
            'history': _i1.ParameterDescription(
              name: 'history',
              type: _i1.getType<_i4.History>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['history'] as _i3.HistoryEndpoint).deleteHistory(
            session,
            params['history'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i5.Endpoints()..initializeEndpoints(server);
  }
}
