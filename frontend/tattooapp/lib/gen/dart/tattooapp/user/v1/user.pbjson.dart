//
//  Generated code. Do not modify.
//  source: tattooapp/user/v1/user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userRoleDescriptor instead')
const UserRole$json = {
  '1': 'UserRole',
  '2': [
    {'1': 'USER_ROLE_UNSPECIFIED', '2': 0},
    {'1': 'USER_ROLE_ARTIST', '2': 1},
    {'1': 'USER_ROLE_CLIENT', '2': 2},
  ],
};

/// Descriptor for `UserRole`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List userRoleDescriptor = $convert.base64Decode(
    'CghVc2VyUm9sZRIZChVVU0VSX1JPTEVfVU5TUEVDSUZJRUQQABIUChBVU0VSX1JPTEVfQVJUSV'
    'NUEAESFAoQVVNFUl9ST0xFX0NMSUVOVBAC');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'role', '3': 2, '4': 1, '5': 14, '6': '.tattooapp.user.v1.UserRole', '10': 'role'},
    {'1': 'first_name', '3': 3, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 4, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'avatar_url', '3': 5, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'created_at', '3': 6, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'updated_at', '3': 7, '4': 1, '5': 9, '10': 'updatedAt'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgJUgJpZBIvCgRyb2xlGAIgASgOMhsudGF0dG9vYXBwLnVzZXIudj'
    'EuVXNlclJvbGVSBHJvbGUSHQoKZmlyc3RfbmFtZRgDIAEoCVIJZmlyc3ROYW1lEhsKCWxhc3Rf'
    'bmFtZRgEIAEoCVIIbGFzdE5hbWUSHQoKYXZhdGFyX3VybBgFIAEoCVIJYXZhdGFyVXJsEh0KCm'
    'NyZWF0ZWRfYXQYBiABKAlSCWNyZWF0ZWRBdBIdCgp1cGRhdGVkX2F0GAcgASgJUgl1cGRhdGVk'
    'QXQ=');

