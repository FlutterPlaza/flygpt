/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;

abstract class History implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String desc;

  DateTime dateTime;

  String iconData;

  Map<DateTime, String> chats;

  int createdById;

  _i2.UserInfo? createdBy;

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
