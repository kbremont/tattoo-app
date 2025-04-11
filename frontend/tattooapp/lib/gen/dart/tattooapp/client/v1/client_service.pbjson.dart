//
//  Generated code. Do not modify.
//  source: tattooapp/client/v1/client_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'client_profile.pbjson.dart' as $2;

@$core.Deprecated('Use createClientProfileRequestDescriptor instead')
const CreateClientProfileRequest$json = {
  '1': 'CreateClientProfileRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'location', '3': 2, '4': 1, '5': 9, '10': 'location'},
  ],
};

/// Descriptor for `CreateClientProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createClientProfileRequestDescriptor = $convert.base64Decode(
    'ChpDcmVhdGVDbGllbnRQcm9maWxlUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSGg'
    'oIbG9jYXRpb24YAiABKAlSCGxvY2F0aW9u');

@$core.Deprecated('Use createClientProfileResponseDescriptor instead')
const CreateClientProfileResponse$json = {
  '1': 'CreateClientProfileResponse',
  '2': [
    {'1': 'client_profile', '3': 1, '4': 1, '5': 11, '6': '.tattooapp.client.v1.ClientProfile', '10': 'clientProfile'},
  ],
};

/// Descriptor for `CreateClientProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createClientProfileResponseDescriptor = $convert.base64Decode(
    'ChtDcmVhdGVDbGllbnRQcm9maWxlUmVzcG9uc2USSQoOY2xpZW50X3Byb2ZpbGUYASABKAsyIi'
    '50YXR0b29hcHAuY2xpZW50LnYxLkNsaWVudFByb2ZpbGVSDWNsaWVudFByb2ZpbGU=');

@$core.Deprecated('Use getClientProfileRequestDescriptor instead')
const GetClientProfileRequest$json = {
  '1': 'GetClientProfileRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetClientProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getClientProfileRequestDescriptor = $convert.base64Decode(
    'ChdHZXRDbGllbnRQcm9maWxlUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQ=');

@$core.Deprecated('Use getClientProfileResponseDescriptor instead')
const GetClientProfileResponse$json = {
  '1': 'GetClientProfileResponse',
  '2': [
    {'1': 'client_profile', '3': 1, '4': 1, '5': 11, '6': '.tattooapp.client.v1.ClientProfile', '10': 'clientProfile'},
  ],
};

/// Descriptor for `GetClientProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getClientProfileResponseDescriptor = $convert.base64Decode(
    'ChhHZXRDbGllbnRQcm9maWxlUmVzcG9uc2USSQoOY2xpZW50X3Byb2ZpbGUYASABKAsyIi50YX'
    'R0b29hcHAuY2xpZW50LnYxLkNsaWVudFByb2ZpbGVSDWNsaWVudFByb2ZpbGU=');

@$core.Deprecated('Use deleteClientProfileRequestDescriptor instead')
const DeleteClientProfileRequest$json = {
  '1': 'DeleteClientProfileRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `DeleteClientProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteClientProfileRequestDescriptor = $convert.base64Decode(
    'ChpEZWxldGVDbGllbnRQcm9maWxlUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQ=');

@$core.Deprecated('Use deleteClientProfileResponseDescriptor instead')
const DeleteClientProfileResponse$json = {
  '1': 'DeleteClientProfileResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteClientProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteClientProfileResponseDescriptor = $convert.base64Decode(
    'ChtEZWxldGVDbGllbnRQcm9maWxlUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw'
    '==');

const $core.Map<$core.String, $core.dynamic> ClientServiceBase$json = {
  '1': 'ClientService',
  '2': [
    {'1': 'CreateClientProfile', '2': '.tattooapp.client.v1.CreateClientProfileRequest', '3': '.tattooapp.client.v1.CreateClientProfileResponse'},
    {'1': 'GetClientProfile', '2': '.tattooapp.client.v1.GetClientProfileRequest', '3': '.tattooapp.client.v1.GetClientProfileResponse'},
    {'1': 'DeleteClientProfile', '2': '.tattooapp.client.v1.DeleteClientProfileRequest', '3': '.tattooapp.client.v1.DeleteClientProfileResponse'},
  ],
};

@$core.Deprecated('Use clientServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> ClientServiceBase$messageJson = {
  '.tattooapp.client.v1.CreateClientProfileRequest': CreateClientProfileRequest$json,
  '.tattooapp.client.v1.CreateClientProfileResponse': CreateClientProfileResponse$json,
  '.tattooapp.client.v1.ClientProfile': $2.ClientProfile$json,
  '.tattooapp.client.v1.GetClientProfileRequest': GetClientProfileRequest$json,
  '.tattooapp.client.v1.GetClientProfileResponse': GetClientProfileResponse$json,
  '.tattooapp.client.v1.DeleteClientProfileRequest': DeleteClientProfileRequest$json,
  '.tattooapp.client.v1.DeleteClientProfileResponse': DeleteClientProfileResponse$json,
};

/// Descriptor for `ClientService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List clientServiceDescriptor = $convert.base64Decode(
    'Cg1DbGllbnRTZXJ2aWNlEngKE0NyZWF0ZUNsaWVudFByb2ZpbGUSLy50YXR0b29hcHAuY2xpZW'
    '50LnYxLkNyZWF0ZUNsaWVudFByb2ZpbGVSZXF1ZXN0GjAudGF0dG9vYXBwLmNsaWVudC52MS5D'
    'cmVhdGVDbGllbnRQcm9maWxlUmVzcG9uc2USbwoQR2V0Q2xpZW50UHJvZmlsZRIsLnRhdHRvb2'
    'FwcC5jbGllbnQudjEuR2V0Q2xpZW50UHJvZmlsZVJlcXVlc3QaLS50YXR0b29hcHAuY2xpZW50'
    'LnYxLkdldENsaWVudFByb2ZpbGVSZXNwb25zZRJ4ChNEZWxldGVDbGllbnRQcm9maWxlEi8udG'
    'F0dG9vYXBwLmNsaWVudC52MS5EZWxldGVDbGllbnRQcm9maWxlUmVxdWVzdBowLnRhdHRvb2Fw'
    'cC5jbGllbnQudjEuRGVsZXRlQ2xpZW50UHJvZmlsZVJlc3BvbnNl');

