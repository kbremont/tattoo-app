//
//  Generated code. Do not modify.
//  source: tattooapp/artist/v1/artist_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'artist_profile.pbjson.dart' as $0;

@$core.Deprecated('Use createArtistProfileRequestDescriptor instead')
const CreateArtistProfileRequest$json = {
  '1': 'CreateArtistProfileRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'bio', '3': 2, '4': 1, '5': 9, '10': 'bio'},
    {'1': 'location', '3': 3, '4': 1, '5': 9, '10': 'location'},
    {'1': 'tattoo_shop', '3': 4, '4': 1, '5': 9, '10': 'tattooShop'},
  ],
};

/// Descriptor for `CreateArtistProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createArtistProfileRequestDescriptor = $convert.base64Decode(
    'ChpDcmVhdGVBcnRpc3RQcm9maWxlUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSEA'
    'oDYmlvGAIgASgJUgNiaW8SGgoIbG9jYXRpb24YAyABKAlSCGxvY2F0aW9uEh8KC3RhdHRvb19z'
    'aG9wGAQgASgJUgp0YXR0b29TaG9w');

@$core.Deprecated('Use createArtistProfileResponseDescriptor instead')
const CreateArtistProfileResponse$json = {
  '1': 'CreateArtistProfileResponse',
  '2': [
    {'1': 'artist_profile', '3': 1, '4': 1, '5': 11, '6': '.tattooapp.artist.v1.ArtistProfile', '10': 'artistProfile'},
  ],
};

/// Descriptor for `CreateArtistProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createArtistProfileResponseDescriptor = $convert.base64Decode(
    'ChtDcmVhdGVBcnRpc3RQcm9maWxlUmVzcG9uc2USSQoOYXJ0aXN0X3Byb2ZpbGUYASABKAsyIi'
    '50YXR0b29hcHAuYXJ0aXN0LnYxLkFydGlzdFByb2ZpbGVSDWFydGlzdFByb2ZpbGU=');

@$core.Deprecated('Use getArtistProfileRequestDescriptor instead')
const GetArtistProfileRequest$json = {
  '1': 'GetArtistProfileRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetArtistProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getArtistProfileRequestDescriptor = $convert.base64Decode(
    'ChdHZXRBcnRpc3RQcm9maWxlUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQ=');

@$core.Deprecated('Use getArtistProfileResponseDescriptor instead')
const GetArtistProfileResponse$json = {
  '1': 'GetArtistProfileResponse',
  '2': [
    {'1': 'artist_profile', '3': 1, '4': 1, '5': 11, '6': '.tattooapp.artist.v1.ArtistProfile', '10': 'artistProfile'},
  ],
};

/// Descriptor for `GetArtistProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getArtistProfileResponseDescriptor = $convert.base64Decode(
    'ChhHZXRBcnRpc3RQcm9maWxlUmVzcG9uc2USSQoOYXJ0aXN0X3Byb2ZpbGUYASABKAsyIi50YX'
    'R0b29hcHAuYXJ0aXN0LnYxLkFydGlzdFByb2ZpbGVSDWFydGlzdFByb2ZpbGU=');

@$core.Deprecated('Use deleteArtistProfileRequestDescriptor instead')
const DeleteArtistProfileRequest$json = {
  '1': 'DeleteArtistProfileRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `DeleteArtistProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteArtistProfileRequestDescriptor = $convert.base64Decode(
    'ChpEZWxldGVBcnRpc3RQcm9maWxlUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQ=');

@$core.Deprecated('Use deleteArtistProfileResponseDescriptor instead')
const DeleteArtistProfileResponse$json = {
  '1': 'DeleteArtistProfileResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteArtistProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteArtistProfileResponseDescriptor = $convert.base64Decode(
    'ChtEZWxldGVBcnRpc3RQcm9maWxlUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw'
    '==');

const $core.Map<$core.String, $core.dynamic> ArtistServiceBase$json = {
  '1': 'ArtistService',
  '2': [
    {'1': 'CreateArtistProfile', '2': '.tattooapp.artist.v1.CreateArtistProfileRequest', '3': '.tattooapp.artist.v1.CreateArtistProfileResponse'},
    {'1': 'GetArtistProfile', '2': '.tattooapp.artist.v1.GetArtistProfileRequest', '3': '.tattooapp.artist.v1.GetArtistProfileResponse'},
    {'1': 'DeleteArtistProfile', '2': '.tattooapp.artist.v1.DeleteArtistProfileRequest', '3': '.tattooapp.artist.v1.DeleteArtistProfileResponse'},
  ],
};

@$core.Deprecated('Use artistServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> ArtistServiceBase$messageJson = {
  '.tattooapp.artist.v1.CreateArtistProfileRequest': CreateArtistProfileRequest$json,
  '.tattooapp.artist.v1.CreateArtistProfileResponse': CreateArtistProfileResponse$json,
  '.tattooapp.artist.v1.ArtistProfile': $0.ArtistProfile$json,
  '.tattooapp.artist.v1.GetArtistProfileRequest': GetArtistProfileRequest$json,
  '.tattooapp.artist.v1.GetArtistProfileResponse': GetArtistProfileResponse$json,
  '.tattooapp.artist.v1.DeleteArtistProfileRequest': DeleteArtistProfileRequest$json,
  '.tattooapp.artist.v1.DeleteArtistProfileResponse': DeleteArtistProfileResponse$json,
};

/// Descriptor for `ArtistService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List artistServiceDescriptor = $convert.base64Decode(
    'Cg1BcnRpc3RTZXJ2aWNlEngKE0NyZWF0ZUFydGlzdFByb2ZpbGUSLy50YXR0b29hcHAuYXJ0aX'
    'N0LnYxLkNyZWF0ZUFydGlzdFByb2ZpbGVSZXF1ZXN0GjAudGF0dG9vYXBwLmFydGlzdC52MS5D'
    'cmVhdGVBcnRpc3RQcm9maWxlUmVzcG9uc2USbwoQR2V0QXJ0aXN0UHJvZmlsZRIsLnRhdHRvb2'
    'FwcC5hcnRpc3QudjEuR2V0QXJ0aXN0UHJvZmlsZVJlcXVlc3QaLS50YXR0b29hcHAuYXJ0aXN0'
    'LnYxLkdldEFydGlzdFByb2ZpbGVSZXNwb25zZRJ4ChNEZWxldGVBcnRpc3RQcm9maWxlEi8udG'
    'F0dG9vYXBwLmFydGlzdC52MS5EZWxldGVBcnRpc3RQcm9maWxlUmVxdWVzdBowLnRhdHRvb2Fw'
    'cC5hcnRpc3QudjEuRGVsZXRlQXJ0aXN0UHJvZmlsZVJlc3BvbnNl');

