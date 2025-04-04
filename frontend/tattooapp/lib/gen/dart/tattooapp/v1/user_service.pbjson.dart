//
//  Generated code. Do not modify.
//  source: tattooapp/v1/user_service.proto
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

@$core.Deprecated('Use createUserRequestDescriptor instead')
const CreateUserRequest$json = {
  '1': 'CreateUserRequest',
  '2': [
    {'1': 'auth0_user_id', '3': 1, '4': 1, '5': 9, '10': 'auth0UserId'},
    {'1': 'role', '3': 2, '4': 1, '5': 14, '6': '.tattooapp.v1.UserRole', '10': 'role'},
    {'1': 'first_name', '3': 3, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 4, '4': 1, '5': 9, '10': 'lastName'},
  ],
};

/// Descriptor for `CreateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVVc2VyUmVxdWVzdBIiCg1hdXRoMF91c2VyX2lkGAEgASgJUgthdXRoMFVzZXJJZB'
    'IqCgRyb2xlGAIgASgOMhYudGF0dG9vYXBwLnYxLlVzZXJSb2xlUgRyb2xlEh0KCmZpcnN0X25h'
    'bWUYAyABKAlSCWZpcnN0TmFtZRIbCglsYXN0X25hbWUYBCABKAlSCGxhc3ROYW1l');

@$core.Deprecated('Use createUserResponseDescriptor instead')
const CreateUserResponse$json = {
  '1': 'CreateUserResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.tattooapp.v1.User', '10': 'user'},
  ],
};

/// Descriptor for `CreateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserResponseDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVVc2VyUmVzcG9uc2USJgoEdXNlchgBIAEoCzISLnRhdHRvb2FwcC52MS5Vc2VyUg'
    'R1c2Vy');

@$core.Deprecated('Use getUserRequestDescriptor instead')
const GetUserRequest$json = {
  '1': 'GetUserRequest',
  '2': [
    {'1': 'auth0_user_id', '3': 1, '4': 1, '5': 9, '10': 'auth0UserId'},
  ],
};

/// Descriptor for `GetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRVc2VyUmVxdWVzdBIiCg1hdXRoMF91c2VyX2lkGAEgASgJUgthdXRoMFVzZXJJZA==');

@$core.Deprecated('Use getUserResponseDescriptor instead')
const GetUserResponse$json = {
  '1': 'GetUserResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.tattooapp.v1.User', '10': 'user'},
  ],
};

/// Descriptor for `GetUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRVc2VyUmVzcG9uc2USJgoEdXNlchgBIAEoCzISLnRhdHRvb2FwcC52MS5Vc2VyUgR1c2'
    'Vy');

@$core.Deprecated('Use updateUserRequestDescriptor instead')
const UpdateUserRequest$json = {
  '1': 'UpdateUserRequest',
  '2': [
    {'1': 'auth0_user_id', '3': 1, '4': 1, '5': 9, '10': 'auth0UserId'},
    {'1': 'first_name', '3': 2, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 3, '4': 1, '5': 9, '10': 'lastName'},
  ],
};

/// Descriptor for `UpdateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVVc2VyUmVxdWVzdBIiCg1hdXRoMF91c2VyX2lkGAEgASgJUgthdXRoMFVzZXJJZB'
    'IdCgpmaXJzdF9uYW1lGAIgASgJUglmaXJzdE5hbWUSGwoJbGFzdF9uYW1lGAMgASgJUghsYXN0'
    'TmFtZQ==');

@$core.Deprecated('Use updateUserResponseDescriptor instead')
const UpdateUserResponse$json = {
  '1': 'UpdateUserResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.tattooapp.v1.User', '10': 'user'},
  ],
};

/// Descriptor for `UpdateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserResponseDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVVc2VyUmVzcG9uc2USJgoEdXNlchgBIAEoCzISLnRhdHRvb2FwcC52MS5Vc2VyUg'
    'R1c2Vy');

@$core.Deprecated('Use deleteUserRequestDescriptor instead')
const DeleteUserRequest$json = {
  '1': 'DeleteUserRequest',
  '2': [
    {'1': 'auth0_user_id', '3': 1, '4': 1, '5': 9, '10': 'auth0UserId'},
  ],
};

/// Descriptor for `DeleteUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVVc2VyUmVxdWVzdBIiCg1hdXRoMF91c2VyX2lkGAEgASgJUgthdXRoMFVzZXJJZA'
    '==');

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
    {'1': 'CreateUser', '2': '.tattooapp.v1.CreateUserRequest', '3': '.tattooapp.v1.CreateUserResponse'},
    {'1': 'GetUser', '2': '.tattooapp.v1.GetUserRequest', '3': '.tattooapp.v1.GetUserResponse'},
    {'1': 'UpdateUser', '2': '.tattooapp.v1.UpdateUserRequest', '3': '.tattooapp.v1.UpdateUserResponse'},
    {'1': 'DeleteUser', '2': '.tattooapp.v1.DeleteUserRequest', '3': '.tattooapp.v1.DeleteUserResponse'},
  ],
};

@$core.Deprecated('Use userServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> UserServiceBase$messageJson = {
  '.tattooapp.v1.CreateUserRequest': CreateUserRequest$json,
  '.tattooapp.v1.CreateUserResponse': CreateUserResponse$json,
  '.tattooapp.v1.User': $0.User$json,
  '.tattooapp.v1.GetUserRequest': GetUserRequest$json,
  '.tattooapp.v1.GetUserResponse': GetUserResponse$json,
  '.tattooapp.v1.UpdateUserRequest': UpdateUserRequest$json,
  '.tattooapp.v1.UpdateUserResponse': UpdateUserResponse$json,
  '.tattooapp.v1.DeleteUserRequest': DeleteUserRequest$json,
  '.tattooapp.v1.DeleteUserResponse': DeleteUserResponse$json,
};

/// Descriptor for `UserService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List userServiceDescriptor = $convert.base64Decode(
    'CgtVc2VyU2VydmljZRJPCgpDcmVhdGVVc2VyEh8udGF0dG9vYXBwLnYxLkNyZWF0ZVVzZXJSZX'
    'F1ZXN0GiAudGF0dG9vYXBwLnYxLkNyZWF0ZVVzZXJSZXNwb25zZRJGCgdHZXRVc2VyEhwudGF0'
    'dG9vYXBwLnYxLkdldFVzZXJSZXF1ZXN0Gh0udGF0dG9vYXBwLnYxLkdldFVzZXJSZXNwb25zZR'
    'JPCgpVcGRhdGVVc2VyEh8udGF0dG9vYXBwLnYxLlVwZGF0ZVVzZXJSZXF1ZXN0GiAudGF0dG9v'
    'YXBwLnYxLlVwZGF0ZVVzZXJSZXNwb25zZRJPCgpEZWxldGVVc2VyEh8udGF0dG9vYXBwLnYxLk'
    'RlbGV0ZVVzZXJSZXF1ZXN0GiAudGF0dG9vYXBwLnYxLkRlbGV0ZVVzZXJSZXNwb25zZQ==');

