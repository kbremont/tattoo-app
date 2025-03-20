//
//  Generated code. Do not modify.
//  source: tattooapp/v1/artist_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'user.pbjson.dart' as $0;

@$core.Deprecated('Use linkInstagramAccountRequestDescriptor instead')
const LinkInstagramAccountRequest$json = {
  '1': 'LinkInstagramAccountRequest',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.tattooapp.v1.User', '10': 'user'},
    {'1': 'instagram_handle', '3': 2, '4': 1, '5': 9, '10': 'instagramHandle'},
  ],
};

/// Descriptor for `LinkInstagramAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List linkInstagramAccountRequestDescriptor = $convert.base64Decode(
    'ChtMaW5rSW5zdGFncmFtQWNjb3VudFJlcXVlc3QSJgoEdXNlchgBIAEoCzISLnRhdHRvb2FwcC'
    '52MS5Vc2VyUgR1c2VyEikKEGluc3RhZ3JhbV9oYW5kbGUYAiABKAlSD2luc3RhZ3JhbUhhbmRs'
    'ZQ==');

@$core.Deprecated('Use linkInstagramAccountResponseDescriptor instead')
const LinkInstagramAccountResponse$json = {
  '1': 'LinkInstagramAccountResponse',
  '2': [
    {'1': 'instagram_handle', '3': 1, '4': 1, '5': 9, '10': 'instagramHandle'},
  ],
};

/// Descriptor for `LinkInstagramAccountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List linkInstagramAccountResponseDescriptor = $convert.base64Decode(
    'ChxMaW5rSW5zdGFncmFtQWNjb3VudFJlc3BvbnNlEikKEGluc3RhZ3JhbV9oYW5kbGUYASABKA'
    'lSD2luc3RhZ3JhbUhhbmRsZQ==');

@$core.Deprecated('Use createArtistRequestDescriptor instead')
const CreateArtistRequest$json = {
  '1': 'CreateArtistRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'style', '3': 2, '4': 1, '5': 9, '10': 'style'},
  ],
};

/// Descriptor for `CreateArtistRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createArtistRequestDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVBcnRpc3RSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAVSBnVzZXJJZBIUCgVzdHlsZR'
    'gCIAEoCVIFc3R5bGU=');

@$core.Deprecated('Use createArtistResponseDescriptor instead')
const CreateArtistResponse$json = {
  '1': 'CreateArtistResponse',
  '2': [
    {'1': 'artist_id', '3': 1, '4': 1, '5': 5, '10': 'artistId'},
  ],
};

/// Descriptor for `CreateArtistResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createArtistResponseDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVBcnRpc3RSZXNwb25zZRIbCglhcnRpc3RfaWQYASABKAVSCGFydGlzdElk');

const $core.Map<$core.String, $core.dynamic> ArtistServiceBase$json = {
  '1': 'ArtistService',
  '2': [
    {'1': 'LinkInstagramAccount', '2': '.tattooapp.v1.LinkInstagramAccountRequest', '3': '.tattooapp.v1.LinkInstagramAccountResponse'},
    {'1': 'CreateArtist', '2': '.tattooapp.v1.CreateArtistRequest', '3': '.tattooapp.v1.CreateArtistResponse'},
  ],
};

@$core.Deprecated('Use artistServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> ArtistServiceBase$messageJson = {
  '.tattooapp.v1.LinkInstagramAccountRequest': LinkInstagramAccountRequest$json,
  '.tattooapp.v1.User': $0.User$json,
  '.tattooapp.v1.LinkInstagramAccountResponse': LinkInstagramAccountResponse$json,
  '.tattooapp.v1.CreateArtistRequest': CreateArtistRequest$json,
  '.tattooapp.v1.CreateArtistResponse': CreateArtistResponse$json,
};

/// Descriptor for `ArtistService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List artistServiceDescriptor = $convert.base64Decode(
    'Cg1BcnRpc3RTZXJ2aWNlEm0KFExpbmtJbnN0YWdyYW1BY2NvdW50EikudGF0dG9vYXBwLnYxLk'
    'xpbmtJbnN0YWdyYW1BY2NvdW50UmVxdWVzdBoqLnRhdHRvb2FwcC52MS5MaW5rSW5zdGFncmFt'
    'QWNjb3VudFJlc3BvbnNlElUKDENyZWF0ZUFydGlzdBIhLnRhdHRvb2FwcC52MS5DcmVhdGVBcn'
    'Rpc3RSZXF1ZXN0GiIudGF0dG9vYXBwLnYxLkNyZWF0ZUFydGlzdFJlc3BvbnNl');

