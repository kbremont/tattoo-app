//
//  Generated code. Do not modify.
//  source: tattooapp/client/v1/client_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'client_profile.pb.dart' as $2;

class CreateClientProfileRequest extends $pb.GeneratedMessage {
  factory CreateClientProfileRequest({
    $core.String? userId,
    $core.String? location,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (location != null) {
      $result.location = location;
    }
    return $result;
  }
  CreateClientProfileRequest._() : super();
  factory CreateClientProfileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateClientProfileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateClientProfileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.client.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'location')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateClientProfileRequest clone() => CreateClientProfileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateClientProfileRequest copyWith(void Function(CreateClientProfileRequest) updates) => super.copyWith((message) => updates(message as CreateClientProfileRequest)) as CreateClientProfileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateClientProfileRequest create() => CreateClientProfileRequest._();
  CreateClientProfileRequest createEmptyInstance() => create();
  static $pb.PbList<CreateClientProfileRequest> createRepeated() => $pb.PbList<CreateClientProfileRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateClientProfileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateClientProfileRequest>(create);
  static CreateClientProfileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get location => $_getSZ(1);
  @$pb.TagNumber(2)
  set location($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocation() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocation() => clearField(2);
}

class CreateClientProfileResponse extends $pb.GeneratedMessage {
  factory CreateClientProfileResponse({
    $2.ClientProfile? clientProfile,
  }) {
    final $result = create();
    if (clientProfile != null) {
      $result.clientProfile = clientProfile;
    }
    return $result;
  }
  CreateClientProfileResponse._() : super();
  factory CreateClientProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateClientProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateClientProfileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.client.v1'), createEmptyInstance: create)
    ..aOM<$2.ClientProfile>(1, _omitFieldNames ? '' : 'clientProfile', subBuilder: $2.ClientProfile.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateClientProfileResponse clone() => CreateClientProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateClientProfileResponse copyWith(void Function(CreateClientProfileResponse) updates) => super.copyWith((message) => updates(message as CreateClientProfileResponse)) as CreateClientProfileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateClientProfileResponse create() => CreateClientProfileResponse._();
  CreateClientProfileResponse createEmptyInstance() => create();
  static $pb.PbList<CreateClientProfileResponse> createRepeated() => $pb.PbList<CreateClientProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateClientProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateClientProfileResponse>(create);
  static CreateClientProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $2.ClientProfile get clientProfile => $_getN(0);
  @$pb.TagNumber(1)
  set clientProfile($2.ClientProfile v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientProfile() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientProfile() => clearField(1);
  @$pb.TagNumber(1)
  $2.ClientProfile ensureClientProfile() => $_ensure(0);
}

class GetClientProfileRequest extends $pb.GeneratedMessage {
  factory GetClientProfileRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  GetClientProfileRequest._() : super();
  factory GetClientProfileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetClientProfileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetClientProfileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.client.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetClientProfileRequest clone() => GetClientProfileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetClientProfileRequest copyWith(void Function(GetClientProfileRequest) updates) => super.copyWith((message) => updates(message as GetClientProfileRequest)) as GetClientProfileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetClientProfileRequest create() => GetClientProfileRequest._();
  GetClientProfileRequest createEmptyInstance() => create();
  static $pb.PbList<GetClientProfileRequest> createRepeated() => $pb.PbList<GetClientProfileRequest>();
  @$core.pragma('dart2js:noInline')
  static GetClientProfileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetClientProfileRequest>(create);
  static GetClientProfileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class GetClientProfileResponse extends $pb.GeneratedMessage {
  factory GetClientProfileResponse({
    $2.ClientProfile? clientProfile,
  }) {
    final $result = create();
    if (clientProfile != null) {
      $result.clientProfile = clientProfile;
    }
    return $result;
  }
  GetClientProfileResponse._() : super();
  factory GetClientProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetClientProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetClientProfileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.client.v1'), createEmptyInstance: create)
    ..aOM<$2.ClientProfile>(1, _omitFieldNames ? '' : 'clientProfile', subBuilder: $2.ClientProfile.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetClientProfileResponse clone() => GetClientProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetClientProfileResponse copyWith(void Function(GetClientProfileResponse) updates) => super.copyWith((message) => updates(message as GetClientProfileResponse)) as GetClientProfileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetClientProfileResponse create() => GetClientProfileResponse._();
  GetClientProfileResponse createEmptyInstance() => create();
  static $pb.PbList<GetClientProfileResponse> createRepeated() => $pb.PbList<GetClientProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static GetClientProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetClientProfileResponse>(create);
  static GetClientProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $2.ClientProfile get clientProfile => $_getN(0);
  @$pb.TagNumber(1)
  set clientProfile($2.ClientProfile v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientProfile() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientProfile() => clearField(1);
  @$pb.TagNumber(1)
  $2.ClientProfile ensureClientProfile() => $_ensure(0);
}

class DeleteClientProfileRequest extends $pb.GeneratedMessage {
  factory DeleteClientProfileRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  DeleteClientProfileRequest._() : super();
  factory DeleteClientProfileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteClientProfileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteClientProfileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.client.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteClientProfileRequest clone() => DeleteClientProfileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteClientProfileRequest copyWith(void Function(DeleteClientProfileRequest) updates) => super.copyWith((message) => updates(message as DeleteClientProfileRequest)) as DeleteClientProfileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteClientProfileRequest create() => DeleteClientProfileRequest._();
  DeleteClientProfileRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteClientProfileRequest> createRepeated() => $pb.PbList<DeleteClientProfileRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteClientProfileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteClientProfileRequest>(create);
  static DeleteClientProfileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class DeleteClientProfileResponse extends $pb.GeneratedMessage {
  factory DeleteClientProfileResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  DeleteClientProfileResponse._() : super();
  factory DeleteClientProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteClientProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteClientProfileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.client.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteClientProfileResponse clone() => DeleteClientProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteClientProfileResponse copyWith(void Function(DeleteClientProfileResponse) updates) => super.copyWith((message) => updates(message as DeleteClientProfileResponse)) as DeleteClientProfileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteClientProfileResponse create() => DeleteClientProfileResponse._();
  DeleteClientProfileResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteClientProfileResponse> createRepeated() => $pb.PbList<DeleteClientProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteClientProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteClientProfileResponse>(create);
  static DeleteClientProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class ClientServiceApi {
  $pb.RpcClient _client;
  ClientServiceApi(this._client);

  $async.Future<CreateClientProfileResponse> createClientProfile($pb.ClientContext? ctx, CreateClientProfileRequest request) =>
    _client.invoke<CreateClientProfileResponse>(ctx, 'ClientService', 'CreateClientProfile', request, CreateClientProfileResponse())
  ;
  $async.Future<GetClientProfileResponse> getClientProfile($pb.ClientContext? ctx, GetClientProfileRequest request) =>
    _client.invoke<GetClientProfileResponse>(ctx, 'ClientService', 'GetClientProfile', request, GetClientProfileResponse())
  ;
  $async.Future<DeleteClientProfileResponse> deleteClientProfile($pb.ClientContext? ctx, DeleteClientProfileRequest request) =>
    _client.invoke<DeleteClientProfileResponse>(ctx, 'ClientService', 'DeleteClientProfile', request, DeleteClientProfileResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
