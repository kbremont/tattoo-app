//
//  Generated code. Do not modify.
//  source: tattooapp/v1/artist.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use artistDescriptor instead')
const Artist$json = {
  '1': 'Artist',
  '2': [
    {'1': 'artist_id', '3': 1, '4': 1, '5': 5, '10': 'artistId'},
    {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.tattooapp.v1.User', '10': 'user'},
    {'1': 'style', '3': 3, '4': 1, '5': 9, '10': 'style'},
  ],
};

/// Descriptor for `Artist`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List artistDescriptor = $convert.base64Decode(
    'CgZBcnRpc3QSGwoJYXJ0aXN0X2lkGAEgASgFUghhcnRpc3RJZBImCgR1c2VyGAIgASgLMhIudG'
    'F0dG9vYXBwLnYxLlVzZXJSBHVzZXISFAoFc3R5bGUYAyABKAlSBXN0eWxl');

