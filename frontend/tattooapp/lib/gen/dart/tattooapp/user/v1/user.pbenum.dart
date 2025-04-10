//
//  Generated code. Do not modify.
//  source: tattooapp/user/v1/user.proto
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

class TattooStyle extends $pb.ProtobufEnum {
  static const TattooStyle TATTOO_STYLE_UNSPECIFIED = TattooStyle._(0, _omitEnumNames ? '' : 'TATTOO_STYLE_UNSPECIFIED');
  static const TattooStyle TATTOO_STYLE_AMERICAN_TRADITIONAL = TattooStyle._(1, _omitEnumNames ? '' : 'TATTOO_STYLE_AMERICAN_TRADITIONAL');
  static const TattooStyle TATTOO_STYLE_REALISM = TattooStyle._(2, _omitEnumNames ? '' : 'TATTOO_STYLE_REALISM');
  static const TattooStyle TATTOO_STYLE_WATER_COLOR = TattooStyle._(3, _omitEnumNames ? '' : 'TATTOO_STYLE_WATER_COLOR');
  static const TattooStyle TATTOO_STYLE_JAPANESE_TRADITIONAL = TattooStyle._(4, _omitEnumNames ? '' : 'TATTOO_STYLE_JAPANESE_TRADITIONAL');

  static const $core.List<TattooStyle> values = <TattooStyle> [
    TATTOO_STYLE_UNSPECIFIED,
    TATTOO_STYLE_AMERICAN_TRADITIONAL,
    TATTOO_STYLE_REALISM,
    TATTOO_STYLE_WATER_COLOR,
    TATTOO_STYLE_JAPANESE_TRADITIONAL,
  ];

  static final $core.Map<$core.int, TattooStyle> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TattooStyle? valueOf($core.int value) => _byValue[value];

  const TattooStyle._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
