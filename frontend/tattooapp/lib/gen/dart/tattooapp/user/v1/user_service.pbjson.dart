//
//  Generated code. Do not modify.
//  source: tattooapp/user/v1/user_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'user.pbjson.dart' as $2;

@$core.Deprecated('Use createUserRequestDescriptor instead')
const CreateUserRequest$json = {
  '1': 'CreateUserRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'role', '3': 2, '4': 1, '5': 14, '6': '.tattooapp.user.v1.UserRole', '10': 'role'},
    {'1': 'first_name', '3': 3, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 4, '4': 1, '5': 9, '10': 'lastName'},
  ],
};

/// Descriptor for `CreateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVVc2VyUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSLwoEcm9sZRgCIAEoDjIbLnRhdH'
    'Rvb2FwcC51c2VyLnYxLlVzZXJSb2xlUgRyb2xlEh0KCmZpcnN0X25hbWUYAyABKAlSCWZpcnN0'
    'TmFtZRIbCglsYXN0X25hbWUYBCABKAlSCGxhc3ROYW1l');

@$core.Deprecated('Use createUserResponseDescriptor instead')
const CreateUserResponse$json = {
  '1': 'CreateUserResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.tattooapp.user.v1.User', '10': 'user'},
  ],
};

/// Descriptor for `CreateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserResponseDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVVc2VyUmVzcG9uc2USKwoEdXNlchgBIAEoCzIXLnRhdHRvb2FwcC51c2VyLnYxLl'
    'VzZXJSBHVzZXI=');

@$core.Deprecated('Use getUserRequestDescriptor instead')
const GetUserRequest$json = {
  '1': 'GetUserRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRVc2VyUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use getUserResponseDescriptor instead')
const GetUserResponse$json = {
  '1': 'GetUserResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.tattooapp.user.v1.User', '10': 'user'},
  ],
};

/// Descriptor for `GetUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRVc2VyUmVzcG9uc2USKwoEdXNlchgBIAEoCzIXLnRhdHRvb2FwcC51c2VyLnYxLlVzZX'
    'JSBHVzZXI=');

@$core.Deprecated('Use updateUserRequestDescriptor instead')
const UpdateUserRequest$json = {
  '1': 'UpdateUserRequest',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.tattooapp.user.v1.User', '10': 'user'},
  ],
};

/// Descriptor for `UpdateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVVc2VyUmVxdWVzdBIrCgR1c2VyGAEgASgLMhcudGF0dG9vYXBwLnVzZXIudjEuVX'
    'NlclIEdXNlcg==');

@$core.Deprecated('Use updateUserResponseDescriptor instead')
const UpdateUserResponse$json = {
  '1': 'UpdateUserResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.tattooapp.user.v1.User', '10': 'user'},
  ],
};

/// Descriptor for `UpdateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserResponseDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVVc2VyUmVzcG9uc2USKwoEdXNlchgBIAEoCzIXLnRhdHRvb2FwcC51c2VyLnYxLl'
    'VzZXJSBHVzZXI=');

@$core.Deprecated('Use deleteUserRequestDescriptor instead')
const DeleteUserRequest$json = {
  '1': 'DeleteUserRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVVc2VyUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use deleteUserResponseDescriptor instead')
const DeleteUserResponse$json = {
  '1': 'DeleteUserResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserResponseDescriptor = $convert.base64Decode(
    'ChJEZWxldGVVc2VyUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

const $core.Map<$core.String, $core.dynamic> UserServiceBase$json = {
  '1': 'UserService',
  '2': [
    {'1': 'CreateUser', '2': '.tattooapp.user.v1.CreateUserRequest', '3': '.tattooapp.user.v1.CreateUserResponse'},
    {'1': 'GetUser', '2': '.tattooapp.user.v1.GetUserRequest', '3': '.tattooapp.user.v1.GetUserResponse'},
    {'1': 'UpdateUser', '2': '.tattooapp.user.v1.UpdateUserRequest', '3': '.tattooapp.user.v1.UpdateUserResponse'},
    {'1': 'DeleteUser', '2': '.tattooapp.user.v1.DeleteUserRequest', '3': '.tattooapp.user.v1.DeleteUserResponse'},
  ],
};

@$core.Deprecated('Use userServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> UserServiceBase$messageJson = {
  '.tattooapp.user.v1.CreateUserRequest': CreateUserRequest$json,
  '.tattooapp.user.v1.CreateUserResponse': CreateUserResponse$json,
  '.tattooapp.user.v1.User': $2.User$json,
  '.tattooapp.user.v1.GetUserRequest': GetUserRequest$json,
  '.tattooapp.user.v1.GetUserResponse': GetUserResponse$json,
  '.tattooapp.user.v1.UpdateUserRequest': UpdateUserRequest$json,
  '.tattooapp.user.v1.UpdateUserResponse': UpdateUserResponse$json,
  '.tattooapp.user.v1.DeleteUserRequest': DeleteUserRequest$json,
  '.tattooapp.user.v1.DeleteUserResponse': DeleteUserResponse$json,
};

/// Descriptor for `UserService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List userServiceDescriptor = $convert.base64Decode(
    'CgtVc2VyU2VydmljZRJZCgpDcmVhdGVVc2VyEiQudGF0dG9vYXBwLnVzZXIudjEuQ3JlYXRlVX'
    'NlclJlcXVlc3QaJS50YXR0b29hcHAudXNlci52MS5DcmVhdGVVc2VyUmVzcG9uc2USUAoHR2V0'
    'VXNlchIhLnRhdHRvb2FwcC51c2VyLnYxLkdldFVzZXJSZXF1ZXN0GiIudGF0dG9vYXBwLnVzZX'
    'IudjEuR2V0VXNlclJlc3BvbnNlElkKClVwZGF0ZVVzZXISJC50YXR0b29hcHAudXNlci52MS5V'
    'cGRhdGVVc2VyUmVxdWVzdBolLnRhdHRvb2FwcC51c2VyLnYxLlVwZGF0ZVVzZXJSZXNwb25zZR'
    'JZCgpEZWxldGVVc2VyEiQudGF0dG9vYXBwLnVzZXIudjEuRGVsZXRlVXNlclJlcXVlc3QaJS50'
    'YXR0b29hcHAudXNlci52MS5EZWxldGVVc2VyUmVzcG9uc2U=');

