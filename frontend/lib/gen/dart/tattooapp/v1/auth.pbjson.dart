//
//  Generated code. Do not modify.
//  source: tattooapp/v1/auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userCredentialsDescriptor instead')
const UserCredentials$json = {
  '1': 'UserCredentials',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `UserCredentials`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userCredentialsDescriptor = $convert.base64Decode(
    'Cg9Vc2VyQ3JlZGVudGlhbHMSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgAS'
    'gJUghwYXNzd29yZA==');

@$core.Deprecated('Use userIdDescriptor instead')
const UserId$json = {
  '1': 'UserId',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `UserId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userIdDescriptor = $convert.base64Decode(
    'CgZVc2VySWQSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklk');

@$core.Deprecated('Use authTokenDescriptor instead')
const AuthToken$json = {
  '1': 'AuthToken',
  '2': [
    {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'expires_at', '3': 3, '4': 1, '5': 9, '10': 'expiresAt'},
  ],
};

/// Descriptor for `AuthToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authTokenDescriptor = $convert.base64Decode(
    'CglBdXRoVG9rZW4SIQoMYWNjZXNzX3Rva2VuGAEgASgJUgthY2Nlc3NUb2tlbhIjCg1yZWZyZX'
    'NoX3Rva2VuGAIgASgJUgxyZWZyZXNoVG9rZW4SHQoKZXhwaXJlc19hdBgDIAEoCVIJZXhwaXJl'
    'c0F0');

