//
//  Generated code. Do not modify.
//  source: tattooapp/v1/auth_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'auth.pbjson.dart' as $0;

@$core.Deprecated('Use signUpRequestDescriptor instead')
const SignUpRequest$json = {
  '1': 'SignUpRequest',
  '2': [
    {'1': 'credentials', '3': 1, '4': 1, '5': 11, '6': '.tattooapp.v1.UserCredentials', '10': 'credentials'},
    {'1': 'first_name', '3': 2, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 3, '4': 1, '5': 9, '10': 'lastName'},
  ],
};

/// Descriptor for `SignUpRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signUpRequestDescriptor = $convert.base64Decode(
    'Cg1TaWduVXBSZXF1ZXN0Ej8KC2NyZWRlbnRpYWxzGAEgASgLMh0udGF0dG9vYXBwLnYxLlVzZX'
    'JDcmVkZW50aWFsc1ILY3JlZGVudGlhbHMSHQoKZmlyc3RfbmFtZRgCIAEoCVIJZmlyc3ROYW1l'
    'EhsKCWxhc3RfbmFtZRgDIAEoCVIIbGFzdE5hbWU=');

@$core.Deprecated('Use signUpResponseDescriptor instead')
const SignUpResponse$json = {
  '1': 'SignUpResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.tattooapp.v1.UserId', '10': 'user'},
    {'1': 'token', '3': 2, '4': 1, '5': 11, '6': '.tattooapp.v1.AuthToken', '10': 'token'},
  ],
};

/// Descriptor for `SignUpResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signUpResponseDescriptor = $convert.base64Decode(
    'Cg5TaWduVXBSZXNwb25zZRIoCgR1c2VyGAEgASgLMhQudGF0dG9vYXBwLnYxLlVzZXJJZFIEdX'
    'NlchItCgV0b2tlbhgCIAEoCzIXLnRhdHRvb2FwcC52MS5BdXRoVG9rZW5SBXRva2Vu');

@$core.Deprecated('Use logInRequestDescriptor instead')
const LogInRequest$json = {
  '1': 'LogInRequest',
  '2': [
    {'1': 'credentials', '3': 1, '4': 1, '5': 11, '6': '.tattooapp.v1.UserCredentials', '10': 'credentials'},
  ],
};

/// Descriptor for `LogInRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logInRequestDescriptor = $convert.base64Decode(
    'CgxMb2dJblJlcXVlc3QSPwoLY3JlZGVudGlhbHMYASABKAsyHS50YXR0b29hcHAudjEuVXNlck'
    'NyZWRlbnRpYWxzUgtjcmVkZW50aWFscw==');

@$core.Deprecated('Use logInResponseDescriptor instead')
const LogInResponse$json = {
  '1': 'LogInResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.tattooapp.v1.UserId', '10': 'user'},
    {'1': 'token', '3': 2, '4': 1, '5': 11, '6': '.tattooapp.v1.AuthToken', '10': 'token'},
  ],
};

/// Descriptor for `LogInResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logInResponseDescriptor = $convert.base64Decode(
    'Cg1Mb2dJblJlc3BvbnNlEigKBHVzZXIYASABKAsyFC50YXR0b29hcHAudjEuVXNlcklkUgR1c2'
    'VyEi0KBXRva2VuGAIgASgLMhcudGF0dG9vYXBwLnYxLkF1dGhUb2tlblIFdG9rZW4=');

@$core.Deprecated('Use refreshTokenRequestDescriptor instead')
const RefreshTokenRequest$json = {
  '1': 'RefreshTokenRequest',
  '2': [
    {'1': 'refresh_token', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `RefreshTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenRequestDescriptor = $convert.base64Decode(
    'ChNSZWZyZXNoVG9rZW5SZXF1ZXN0EiMKDXJlZnJlc2hfdG9rZW4YASABKAlSDHJlZnJlc2hUb2'
    'tlbg==');

@$core.Deprecated('Use refreshTokenResponseDescriptor instead')
const RefreshTokenResponse$json = {
  '1': 'RefreshTokenResponse',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 11, '6': '.tattooapp.v1.AuthToken', '10': 'token'},
  ],
};

/// Descriptor for `RefreshTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenResponseDescriptor = $convert.base64Decode(
    'ChRSZWZyZXNoVG9rZW5SZXNwb25zZRItCgV0b2tlbhgBIAEoCzIXLnRhdHRvb2FwcC52MS5BdX'
    'RoVG9rZW5SBXRva2Vu');

@$core.Deprecated('Use logOutRequestDescriptor instead')
const LogOutRequest$json = {
  '1': 'LogOutRequest',
  '2': [
    {'1': 'refresh_token', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `LogOutRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logOutRequestDescriptor = $convert.base64Decode(
    'Cg1Mb2dPdXRSZXF1ZXN0EiMKDXJlZnJlc2hfdG9rZW4YASABKAlSDHJlZnJlc2hUb2tlbg==');

@$core.Deprecated('Use logOutResponseDescriptor instead')
const LogOutResponse$json = {
  '1': 'LogOutResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `LogOutResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logOutResponseDescriptor = $convert.base64Decode(
    'Cg5Mb2dPdXRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

const $core.Map<$core.String, $core.dynamic> AuthServiceBase$json = {
  '1': 'AuthService',
  '2': [
    {'1': 'SignUp', '2': '.tattooapp.v1.SignUpRequest', '3': '.tattooapp.v1.SignUpResponse'},
    {'1': 'LogIn', '2': '.tattooapp.v1.LogInRequest', '3': '.tattooapp.v1.LogInResponse'},
    {'1': 'RefreshToken', '2': '.tattooapp.v1.RefreshTokenRequest', '3': '.tattooapp.v1.RefreshTokenResponse'},
    {'1': 'LogOut', '2': '.tattooapp.v1.LogOutRequest', '3': '.tattooapp.v1.LogOutResponse'},
  ],
};

@$core.Deprecated('Use authServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> AuthServiceBase$messageJson = {
  '.tattooapp.v1.SignUpRequest': SignUpRequest$json,
  '.tattooapp.v1.UserCredentials': $0.UserCredentials$json,
  '.tattooapp.v1.SignUpResponse': SignUpResponse$json,
  '.tattooapp.v1.UserId': $0.UserId$json,
  '.tattooapp.v1.AuthToken': $0.AuthToken$json,
  '.tattooapp.v1.LogInRequest': LogInRequest$json,
  '.tattooapp.v1.LogInResponse': LogInResponse$json,
  '.tattooapp.v1.RefreshTokenRequest': RefreshTokenRequest$json,
  '.tattooapp.v1.RefreshTokenResponse': RefreshTokenResponse$json,
  '.tattooapp.v1.LogOutRequest': LogOutRequest$json,
  '.tattooapp.v1.LogOutResponse': LogOutResponse$json,
};

/// Descriptor for `AuthService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List authServiceDescriptor = $convert.base64Decode(
    'CgtBdXRoU2VydmljZRJDCgZTaWduVXASGy50YXR0b29hcHAudjEuU2lnblVwUmVxdWVzdBocLn'
    'RhdHRvb2FwcC52MS5TaWduVXBSZXNwb25zZRJACgVMb2dJbhIaLnRhdHRvb2FwcC52MS5Mb2dJ'
    'blJlcXVlc3QaGy50YXR0b29hcHAudjEuTG9nSW5SZXNwb25zZRJVCgxSZWZyZXNoVG9rZW4SIS'
    '50YXR0b29hcHAudjEuUmVmcmVzaFRva2VuUmVxdWVzdBoiLnRhdHRvb2FwcC52MS5SZWZyZXNo'
    'VG9rZW5SZXNwb25zZRJDCgZMb2dPdXQSGy50YXR0b29hcHAudjEuTG9nT3V0UmVxdWVzdBocLn'
    'RhdHRvb2FwcC52MS5Mb2dPdXRSZXNwb25zZQ==');

