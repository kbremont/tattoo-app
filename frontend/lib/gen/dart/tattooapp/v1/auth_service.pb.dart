//
//  Generated code. Do not modify.
//  source: tattooapp/v1/auth_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'auth.pb.dart' as $0;

/// information required to sign up a new user
class SignUpRequest extends $pb.GeneratedMessage {
  factory SignUpRequest({
    $0.UserCredentials? credentials,
  }) {
    final $result = create();
    if (credentials != null) {
      $result.credentials = credentials;
    }
    return $result;
  }
  SignUpRequest._() : super();
  factory SignUpRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignUpRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignUpRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.v1'), createEmptyInstance: create)
    ..aOM<$0.UserCredentials>(1, _omitFieldNames ? '' : 'credentials', subBuilder: $0.UserCredentials.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignUpRequest clone() => SignUpRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignUpRequest copyWith(void Function(SignUpRequest) updates) => super.copyWith((message) => updates(message as SignUpRequest)) as SignUpRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignUpRequest create() => SignUpRequest._();
  SignUpRequest createEmptyInstance() => create();
  static $pb.PbList<SignUpRequest> createRepeated() => $pb.PbList<SignUpRequest>();
  @$core.pragma('dart2js:noInline')
  static SignUpRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignUpRequest>(create);
  static SignUpRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $0.UserCredentials get credentials => $_getN(0);
  @$pb.TagNumber(1)
  set credentials($0.UserCredentials v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCredentials() => $_has(0);
  @$pb.TagNumber(1)
  void clearCredentials() => clearField(1);
  @$pb.TagNumber(1)
  $0.UserCredentials ensureCredentials() => $_ensure(0);
}

/// information returned after signing up a new user
class SignUpResponse extends $pb.GeneratedMessage {
  factory SignUpResponse({
    $0.UserId? user,
    $0.AuthToken? token,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    if (token != null) {
      $result.token = token;
    }
    return $result;
  }
  SignUpResponse._() : super();
  factory SignUpResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignUpResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignUpResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.v1'), createEmptyInstance: create)
    ..aOM<$0.UserId>(1, _omitFieldNames ? '' : 'user', subBuilder: $0.UserId.create)
    ..aOM<$0.AuthToken>(2, _omitFieldNames ? '' : 'token', subBuilder: $0.AuthToken.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignUpResponse clone() => SignUpResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignUpResponse copyWith(void Function(SignUpResponse) updates) => super.copyWith((message) => updates(message as SignUpResponse)) as SignUpResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignUpResponse create() => SignUpResponse._();
  SignUpResponse createEmptyInstance() => create();
  static $pb.PbList<SignUpResponse> createRepeated() => $pb.PbList<SignUpResponse>();
  @$core.pragma('dart2js:noInline')
  static SignUpResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignUpResponse>(create);
  static SignUpResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.UserId get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.UserId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  $0.UserId ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.AuthToken get token => $_getN(1);
  @$pb.TagNumber(2)
  set token($0.AuthToken v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);
  @$pb.TagNumber(2)
  $0.AuthToken ensureToken() => $_ensure(1);
}

/// information required to log in a user
class LogInRequest extends $pb.GeneratedMessage {
  factory LogInRequest({
    $0.UserCredentials? credentials,
  }) {
    final $result = create();
    if (credentials != null) {
      $result.credentials = credentials;
    }
    return $result;
  }
  LogInRequest._() : super();
  factory LogInRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogInRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LogInRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.v1'), createEmptyInstance: create)
    ..aOM<$0.UserCredentials>(1, _omitFieldNames ? '' : 'credentials', subBuilder: $0.UserCredentials.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogInRequest clone() => LogInRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogInRequest copyWith(void Function(LogInRequest) updates) => super.copyWith((message) => updates(message as LogInRequest)) as LogInRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogInRequest create() => LogInRequest._();
  LogInRequest createEmptyInstance() => create();
  static $pb.PbList<LogInRequest> createRepeated() => $pb.PbList<LogInRequest>();
  @$core.pragma('dart2js:noInline')
  static LogInRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogInRequest>(create);
  static LogInRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $0.UserCredentials get credentials => $_getN(0);
  @$pb.TagNumber(1)
  set credentials($0.UserCredentials v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCredentials() => $_has(0);
  @$pb.TagNumber(1)
  void clearCredentials() => clearField(1);
  @$pb.TagNumber(1)
  $0.UserCredentials ensureCredentials() => $_ensure(0);
}

/// information returned after logging in a user
class LogInResponse extends $pb.GeneratedMessage {
  factory LogInResponse({
    $0.UserId? user,
    $0.AuthToken? token,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    if (token != null) {
      $result.token = token;
    }
    return $result;
  }
  LogInResponse._() : super();
  factory LogInResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogInResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LogInResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.v1'), createEmptyInstance: create)
    ..aOM<$0.UserId>(1, _omitFieldNames ? '' : 'user', subBuilder: $0.UserId.create)
    ..aOM<$0.AuthToken>(2, _omitFieldNames ? '' : 'token', subBuilder: $0.AuthToken.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogInResponse clone() => LogInResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogInResponse copyWith(void Function(LogInResponse) updates) => super.copyWith((message) => updates(message as LogInResponse)) as LogInResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogInResponse create() => LogInResponse._();
  LogInResponse createEmptyInstance() => create();
  static $pb.PbList<LogInResponse> createRepeated() => $pb.PbList<LogInResponse>();
  @$core.pragma('dart2js:noInline')
  static LogInResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogInResponse>(create);
  static LogInResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.UserId get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.UserId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  $0.UserId ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.AuthToken get token => $_getN(1);
  @$pb.TagNumber(2)
  set token($0.AuthToken v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);
  @$pb.TagNumber(2)
  $0.AuthToken ensureToken() => $_ensure(1);
}

/// information required to refresh an access token
class RefreshTokenRequest extends $pb.GeneratedMessage {
  factory RefreshTokenRequest({
    $core.String? refreshToken,
  }) {
    final $result = create();
    if (refreshToken != null) {
      $result.refreshToken = refreshToken;
    }
    return $result;
  }
  RefreshTokenRequest._() : super();
  factory RefreshTokenRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshTokenRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RefreshTokenRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refreshToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshTokenRequest clone() => RefreshTokenRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshTokenRequest copyWith(void Function(RefreshTokenRequest) updates) => super.copyWith((message) => updates(message as RefreshTokenRequest)) as RefreshTokenRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshTokenRequest create() => RefreshTokenRequest._();
  RefreshTokenRequest createEmptyInstance() => create();
  static $pb.PbList<RefreshTokenRequest> createRepeated() => $pb.PbList<RefreshTokenRequest>();
  @$core.pragma('dart2js:noInline')
  static RefreshTokenRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshTokenRequest>(create);
  static RefreshTokenRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refreshToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set refreshToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefreshToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefreshToken() => clearField(1);
}

/// information returned after refreshing an access token
class RefreshTokenResponse extends $pb.GeneratedMessage {
  factory RefreshTokenResponse({
    $0.AuthToken? token,
  }) {
    final $result = create();
    if (token != null) {
      $result.token = token;
    }
    return $result;
  }
  RefreshTokenResponse._() : super();
  factory RefreshTokenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshTokenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RefreshTokenResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.v1'), createEmptyInstance: create)
    ..aOM<$0.AuthToken>(1, _omitFieldNames ? '' : 'token', subBuilder: $0.AuthToken.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshTokenResponse clone() => RefreshTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshTokenResponse copyWith(void Function(RefreshTokenResponse) updates) => super.copyWith((message) => updates(message as RefreshTokenResponse)) as RefreshTokenResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshTokenResponse create() => RefreshTokenResponse._();
  RefreshTokenResponse createEmptyInstance() => create();
  static $pb.PbList<RefreshTokenResponse> createRepeated() => $pb.PbList<RefreshTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static RefreshTokenResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshTokenResponse>(create);
  static RefreshTokenResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.AuthToken get token => $_getN(0);
  @$pb.TagNumber(1)
  set token($0.AuthToken v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);
  @$pb.TagNumber(1)
  $0.AuthToken ensureToken() => $_ensure(0);
}

/// information required to log out a user
class LogOutRequest extends $pb.GeneratedMessage {
  factory LogOutRequest({
    $core.String? refreshToken,
  }) {
    final $result = create();
    if (refreshToken != null) {
      $result.refreshToken = refreshToken;
    }
    return $result;
  }
  LogOutRequest._() : super();
  factory LogOutRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogOutRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LogOutRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refreshToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogOutRequest clone() => LogOutRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogOutRequest copyWith(void Function(LogOutRequest) updates) => super.copyWith((message) => updates(message as LogOutRequest)) as LogOutRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogOutRequest create() => LogOutRequest._();
  LogOutRequest createEmptyInstance() => create();
  static $pb.PbList<LogOutRequest> createRepeated() => $pb.PbList<LogOutRequest>();
  @$core.pragma('dart2js:noInline')
  static LogOutRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogOutRequest>(create);
  static LogOutRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refreshToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set refreshToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefreshToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefreshToken() => clearField(1);
}

/// information returned after logging out a user
class LogOutResponse extends $pb.GeneratedMessage {
  factory LogOutResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  LogOutResponse._() : super();
  factory LogOutResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogOutResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LogOutResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogOutResponse clone() => LogOutResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogOutResponse copyWith(void Function(LogOutResponse) updates) => super.copyWith((message) => updates(message as LogOutResponse)) as LogOutResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogOutResponse create() => LogOutResponse._();
  LogOutResponse createEmptyInstance() => create();
  static $pb.PbList<LogOutResponse> createRepeated() => $pb.PbList<LogOutResponse>();
  @$core.pragma('dart2js:noInline')
  static LogOutResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogOutResponse>(create);
  static LogOutResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class AuthServiceApi {
  $pb.RpcClient _client;
  AuthServiceApi(this._client);

  $async.Future<SignUpResponse> signUp($pb.ClientContext? ctx, SignUpRequest request) =>
    _client.invoke<SignUpResponse>(ctx, 'AuthService', 'SignUp', request, SignUpResponse())
  ;
  $async.Future<LogInResponse> logIn($pb.ClientContext? ctx, LogInRequest request) =>
    _client.invoke<LogInResponse>(ctx, 'AuthService', 'LogIn', request, LogInResponse())
  ;
  $async.Future<RefreshTokenResponse> refreshToken($pb.ClientContext? ctx, RefreshTokenRequest request) =>
    _client.invoke<RefreshTokenResponse>(ctx, 'AuthService', 'RefreshToken', request, RefreshTokenResponse())
  ;
  $async.Future<LogOutResponse> logOut($pb.ClientContext? ctx, LogOutRequest request) =>
    _client.invoke<LogOutResponse>(ctx, 'AuthService', 'LogOut', request, LogOutResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
