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
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;

abstract class History implements _i1.TableRow, _i1.ProtocolSerialization {
  History._({
    this.id,
    required this.desc,
    required this.dateTime,
    required this.iconData,
    required this.chats,
    required this.createdById,
    this.createdBy,
  });

  factory History({
    int? id,
    required String desc,
    required DateTime dateTime,
    required String iconData,
    required Map<DateTime, String> chats,
    required int createdById,
    _i2.UserInfo? createdBy,
  }) = _HistoryImpl;

  factory History.fromJson(Map<String, dynamic> jsonSerialization) {
    return History(
      id: jsonSerialization['id'] as int?,
      desc: jsonSerialization['desc'] as String,
      dateTime:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateTime']),
      iconData: jsonSerialization['iconData'] as String,
      chats: (jsonSerialization['chats'] as List).fold<Map<DateTime, String>>(
          {},
          (t, e) => {
                ...t,
                _i1.DateTimeJsonExtension.fromJson(e['k']): e['v'] as String
              }),
      createdById: jsonSerialization['createdById'] as int,
      createdBy: jsonSerialization['createdBy'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['createdBy'] as Map<String, dynamic>)),
    );
  }

  static final t = HistoryTable();

  static const db = HistoryRepository._();

  @override
  int? id;

  String desc;

  DateTime dateTime;

  String iconData;

  Map<DateTime, String> chats;

  int createdById;

  _i2.UserInfo? createdBy;

  @override
  _i1.Table get table => t;

  History copyWith({
    int? id,
    String? desc,
    DateTime? dateTime,
    String? iconData,
    Map<DateTime, String>? chats,
    int? createdById,
    _i2.UserInfo? createdBy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'desc': desc,
      'dateTime': dateTime.toJson(),
      'iconData': iconData,
      'chats': chats.toJson(keyToJson: (k) => k.toJson()),
      'createdById': createdById,
      if (createdBy != null) 'createdBy': createdBy?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'desc': desc,
      'dateTime': dateTime.toJson(),
      'iconData': iconData,
      'chats': chats.toJson(keyToJson: (k) => k.toJson()),
      'createdById': createdById,
      if (createdBy != null) 'createdBy': createdBy?.toJsonForProtocol(),
    };
  }

  static HistoryInclude include({_i2.UserInfoInclude? createdBy}) {
    return HistoryInclude._(createdBy: createdBy);
  }

  static HistoryIncludeList includeList({
    _i1.WhereExpressionBuilder<HistoryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<HistoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HistoryTable>? orderByList,
    HistoryInclude? include,
  }) {
    return HistoryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(History.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(History.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HistoryImpl extends History {
  _HistoryImpl({
    int? id,
    required String desc,
    required DateTime dateTime,
    required String iconData,
    required Map<DateTime, String> chats,
    required int createdById,
    _i2.UserInfo? createdBy,
  }) : super._(
          id: id,
          desc: desc,
          dateTime: dateTime,
          iconData: iconData,
          chats: chats,
          createdById: createdById,
          createdBy: createdBy,
        );

  @override
  History copyWith({
    Object? id = _Undefined,
    String? desc,
    DateTime? dateTime,
    String? iconData,
    Map<DateTime, String>? chats,
    int? createdById,
    Object? createdBy = _Undefined,
  }) {
    return History(
      id: id is int? ? id : this.id,
      desc: desc ?? this.desc,
      dateTime: dateTime ?? this.dateTime,
      iconData: iconData ?? this.iconData,
      chats: chats ??
          this.chats.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0,
                  )),
      createdById: createdById ?? this.createdById,
      createdBy:
          createdBy is _i2.UserInfo? ? createdBy : this.createdBy?.copyWith(),
    );
  }
}

class HistoryTable extends _i1.Table {
  HistoryTable({super.tableRelation}) : super(tableName: 'history') {
    desc = _i1.ColumnString(
      'desc',
      this,
    );
    dateTime = _i1.ColumnDateTime(
      'dateTime',
      this,
    );
    iconData = _i1.ColumnString(
      'iconData',
      this,
    );
    chats = _i1.ColumnSerializable(
      'chats',
      this,
    );
    createdById = _i1.ColumnInt(
      'createdById',
      this,
    );
  }

  late final _i1.ColumnString desc;

  late final _i1.ColumnDateTime dateTime;

  late final _i1.ColumnString iconData;

  late final _i1.ColumnSerializable chats;

  late final _i1.ColumnInt createdById;

  _i2.UserInfoTable? _createdBy;

  _i2.UserInfoTable get createdBy {
    if (_createdBy != null) return _createdBy!;
    _createdBy = _i1.createRelationTable(
      relationFieldName: 'createdBy',
      field: History.t.createdById,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _createdBy!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        desc,
        dateTime,
        iconData,
        chats,
        createdById,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'createdBy') {
      return createdBy;
    }
    return null;
  }
}

class HistoryInclude extends _i1.IncludeObject {
  HistoryInclude._({_i2.UserInfoInclude? createdBy}) {
    _createdBy = createdBy;
  }

  _i2.UserInfoInclude? _createdBy;

  @override
  Map<String, _i1.Include?> get includes => {'createdBy': _createdBy};

  @override
  _i1.Table get table => History.t;
}

class HistoryIncludeList extends _i1.IncludeList {
  HistoryIncludeList._({
    _i1.WhereExpressionBuilder<HistoryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(History.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => History.t;
}

class HistoryRepository {
  const HistoryRepository._();

  final attachRow = const HistoryAttachRowRepository._();

  Future<List<History>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HistoryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<HistoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HistoryTable>? orderByList,
    _i1.Transaction? transaction,
    HistoryInclude? include,
  }) async {
    return session.db.find<History>(
      where: where?.call(History.t),
      orderBy: orderBy?.call(History.t),
      orderByList: orderByList?.call(History.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<History?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HistoryTable>? where,
    int? offset,
    _i1.OrderByBuilder<HistoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HistoryTable>? orderByList,
    _i1.Transaction? transaction,
    HistoryInclude? include,
  }) async {
    return session.db.findFirstRow<History>(
      where: where?.call(History.t),
      orderBy: orderBy?.call(History.t),
      orderByList: orderByList?.call(History.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<History?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    HistoryInclude? include,
  }) async {
    return session.db.findById<History>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<History>> insert(
    _i1.Session session,
    List<History> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<History>(
      rows,
      transaction: transaction,
    );
  }

  Future<History> insertRow(
    _i1.Session session,
    History row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<History>(
      row,
      transaction: transaction,
    );
  }

  Future<List<History>> update(
    _i1.Session session,
    List<History> rows, {
    _i1.ColumnSelections<HistoryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<History>(
      rows,
      columns: columns?.call(History.t),
      transaction: transaction,
    );
  }

  Future<History> updateRow(
    _i1.Session session,
    History row, {
    _i1.ColumnSelections<HistoryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<History>(
      row,
      columns: columns?.call(History.t),
      transaction: transaction,
    );
  }

  Future<List<History>> delete(
    _i1.Session session,
    List<History> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<History>(
      rows,
      transaction: transaction,
    );
  }

  Future<History> deleteRow(
    _i1.Session session,
    History row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<History>(
      row,
      transaction: transaction,
    );
  }

  Future<List<History>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<HistoryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<History>(
      where: where(History.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HistoryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<History>(
      where: where?.call(History.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class HistoryAttachRowRepository {
  const HistoryAttachRowRepository._();

  Future<void> createdBy(
    _i1.Session session,
    History history,
    _i2.UserInfo createdBy, {
    _i1.Transaction? transaction,
  }) async {
    if (history.id == null) {
      throw ArgumentError.notNull('history.id');
    }
    if (createdBy.id == null) {
      throw ArgumentError.notNull('createdBy.id');
    }

    var $history = history.copyWith(createdById: createdBy.id);
    await session.db.updateRow<History>(
      $history,
      columns: [History.t.createdById],
      transaction: transaction,
    );
  }
}
