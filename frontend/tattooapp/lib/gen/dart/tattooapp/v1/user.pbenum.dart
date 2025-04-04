//
//  Generated code. Do not modify.
//  source: tattooapp/v1/user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class UserRole extends $pb.ProtobufEnum {
  static const UserRole USER_ROLE_UNSPECIFIED = UserRole._(0, _omitEnumNames ? '' : 'USER_ROLE_UNSPECIFIED');
  static const UserRole USER_ROLE_ARTIST = UserRole._(1, _omitEnumNames ? '' : 'USER_ROLE_ARTIST');
  static const UserRole USER_ROLE_CLIENT = UserRole._(2, _omitEnumNames ? '' : 'USER_ROLE_CLIENT');

  static const $core.List<UserRole> values = <UserRole> [
    USER_ROLE_UNSPECIFIED,
    USER_ROLE_ARTIST,
    USER_ROLE_CLIENT,
  ];

  static final $core.Map<$core.int, UserRole> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UserRole? valueOf($core.int value) => _byValue[value];

  const UserRole._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
