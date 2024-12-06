import 'package:flygpt_server/src/generated/history.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

// This is an example endpoint of your server. It's best practice to use the
// `Endpoint` ending of the class name, but it will be removed when accessing
// the endpoint from the client. I.e., this endpoint can be accessed through
// `client.example` on the client side.

// After adding or modifying an endpoint, you will need to run
// `serverpod generate` to update the server and client code.
class HistoryEndpoint extends Endpoint {
  // You create methods in your endpoint which are accessible from the client by
  // creating a public method with `Session` as its first parameter.
  // `bool`, `int`, `double`, `String`, `UuidValue`, `Duration`, `DateTime`, `ByteData`,
  // and other serializable classes, exceptions and enums from your from your `protocol` directory.
  // The methods should return a typed future; the same types as for the parameters are
  // supported. The `session` object provides access to the database, logging,
  // passwords, and information about the request being made to the server.
  @override
  bool get requireLogin => true;

  Future<void> createHistory(Session session, History history) async {
    final authenticatedInfo = await session.authenticated;
    if (authenticatedInfo?.userId != history.createdById) {
      throw FormatException('User mismatch');
    }
    await History.db.insertRow(session, history);
  }

  Future<void> updateHistory(Session session, History history) async {
    final authenticatedInfo = await session.authenticated;
    if (authenticatedInfo?.userId != history.createdById) {
      throw FormatException('User mismatch');
    }
    await History.db.updateRow(session, history);
  }

  Future<List<History>> getAllHistory(Session session) async {
    return await History.db.find(session,
        orderBy: (history) => history.dateTime,
        include: History.include(
          createdBy: UserInfo.include(),
        ));
  }

  Future<void> deleteHistory(Session session, History history) async {
    await History.db.deleteRow(session, history);
  }

}
