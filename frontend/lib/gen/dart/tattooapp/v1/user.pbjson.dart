//
//  Generated code. Do not modify.
//  source: tattooapp/v1/user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'is_artist', '3': 2, '4': 1, '5': 8, '10': 'isArtist'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    {'1': 'first_name', '3': 4, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 5, '4': 1, '5': 9, '10': 'lastName'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEhcKB3VzZXJfaWQYASABKAVSBnVzZXJJZBIbCglpc19hcnRpc3QYAiABKAhSCGlzQX'
    'J0aXN0EhQKBWVtYWlsGAMgASgJUgVlbWFpbBIdCgpmaXJzdF9uYW1lGAQgASgJUglmaXJzdE5h'
    'bWUSGwoJbGFzdF9uYW1lGAUgASgJUghsYXN0TmFtZQ==');

