//
//  Generated code. Do not modify.
//  source: tattooapp/artist/v1/artist_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'artist_profile.pb.dart' as $0;

class CreateArtistProfileRequest extends $pb.GeneratedMessage {
  factory CreateArtistProfileRequest({
    $core.String? userId,
    $core.String? bio,
    $core.String? location,
    $core.String? tattooShop,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (bio != null) {
      $result.bio = bio;
    }
    if (location != null) {
      $result.location = location;
    }
    if (tattooShop != null) {
      $result.tattooShop = tattooShop;
    }
    return $result;
  }
  CreateArtistProfileRequest._() : super();
  factory CreateArtistProfileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateArtistProfileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateArtistProfileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.artist.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'bio')
    ..aOS(3, _omitFieldNames ? '' : 'location')
    ..aOS(4, _omitFieldNames ? '' : 'tattooShop')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateArtistProfileRequest clone() => CreateArtistProfileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateArtistProfileRequest copyWith(void Function(CreateArtistProfileRequest) updates) => super.copyWith((message) => updates(message as CreateArtistProfileRequest)) as CreateArtistProfileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateArtistProfileRequest create() => CreateArtistProfileRequest._();
  CreateArtistProfileRequest createEmptyInstance() => create();
  static $pb.PbList<CreateArtistProfileRequest> createRepeated() => $pb.PbList<CreateArtistProfileRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateArtistProfileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateArtistProfileRequest>(create);
  static CreateArtistProfileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get bio => $_getSZ(1);
  @$pb.TagNumber(2)
  set bio($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBio() => $_has(1);
  @$pb.TagNumber(2)
  void clearBio() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get location => $_getSZ(2);
  @$pb.TagNumber(3)
  set location($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLocation() => $_has(2);
  @$pb.TagNumber(3)
  void clearLocation() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get tattooShop => $_getSZ(3);
  @$pb.TagNumber(4)
  set tattooShop($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTattooShop() => $_has(3);
  @$pb.TagNumber(4)
  void clearTattooShop() => clearField(4);
}

class CreateArtistProfileResponse extends $pb.GeneratedMessage {
  factory CreateArtistProfileResponse({
    $0.ArtistProfile? artistProfile,
  }) {
    final $result = create();
    if (artistProfile != null) {
      $result.artistProfile = artistProfile;
    }
    return $result;
  }
  CreateArtistProfileResponse._() : super();
  factory CreateArtistProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateArtistProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateArtistProfileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.artist.v1'), createEmptyInstance: create)
    ..aOM<$0.ArtistProfile>(1, _omitFieldNames ? '' : 'artistProfile', subBuilder: $0.ArtistProfile.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateArtistProfileResponse clone() => CreateArtistProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateArtistProfileResponse copyWith(void Function(CreateArtistProfileResponse) updates) => super.copyWith((message) => updates(message as CreateArtistProfileResponse)) as CreateArtistProfileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateArtistProfileResponse create() => CreateArtistProfileResponse._();
  CreateArtistProfileResponse createEmptyInstance() => create();
  static $pb.PbList<CreateArtistProfileResponse> createRepeated() => $pb.PbList<CreateArtistProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateArtistProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateArtistProfileResponse>(create);
  static CreateArtistProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.ArtistProfile get artistProfile => $_getN(0);
  @$pb.TagNumber(1)
  set artistProfile($0.ArtistProfile v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasArtistProfile() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtistProfile() => clearField(1);
  @$pb.TagNumber(1)
  $0.ArtistProfile ensureArtistProfile() => $_ensure(0);
}

class GetArtistProfileRequest extends $pb.GeneratedMessage {
  factory GetArtistProfileRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  GetArtistProfileRequest._() : super();
  factory GetArtistProfileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetArtistProfileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetArtistProfileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.artist.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetArtistProfileRequest clone() => GetArtistProfileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetArtistProfileRequest copyWith(void Function(GetArtistProfileRequest) updates) => super.copyWith((message) => updates(message as GetArtistProfileRequest)) as GetArtistProfileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetArtistProfileRequest create() => GetArtistProfileRequest._();
  GetArtistProfileRequest createEmptyInstance() => create();
  static $pb.PbList<GetArtistProfileRequest> createRepeated() => $pb.PbList<GetArtistProfileRequest>();
  @$core.pragma('dart2js:noInline')
  static GetArtistProfileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetArtistProfileRequest>(create);
  static GetArtistProfileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class GetArtistProfileResponse extends $pb.GeneratedMessage {
  factory GetArtistProfileResponse({
    $0.ArtistProfile? artistProfile,
  }) {
    final $result = create();
    if (artistProfile != null) {
      $result.artistProfile = artistProfile;
    }
    return $result;
  }
  GetArtistProfileResponse._() : super();
  factory GetArtistProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetArtistProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetArtistProfileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.artist.v1'), createEmptyInstance: create)
    ..aOM<$0.ArtistProfile>(1, _omitFieldNames ? '' : 'artistProfile', subBuilder: $0.ArtistProfile.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetArtistProfileResponse clone() => GetArtistProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetArtistProfileResponse copyWith(void Function(GetArtistProfileResponse) updates) => super.copyWith((message) => updates(message as GetArtistProfileResponse)) as GetArtistProfileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetArtistProfileResponse create() => GetArtistProfileResponse._();
  GetArtistProfileResponse createEmptyInstance() => create();
  static $pb.PbList<GetArtistProfileResponse> createRepeated() => $pb.PbList<GetArtistProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static GetArtistProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetArtistProfileResponse>(create);
  static GetArtistProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.ArtistProfile get artistProfile => $_getN(0);
  @$pb.TagNumber(1)
  set artistProfile($0.ArtistProfile v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasArtistProfile() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtistProfile() => clearField(1);
  @$pb.TagNumber(1)
  $0.ArtistProfile ensureArtistProfile() => $_ensure(0);
}

class DeleteArtistProfileRequest extends $pb.GeneratedMessage {
  factory DeleteArtistProfileRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  DeleteArtistProfileRequest._() : super();
  factory DeleteArtistProfileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteArtistProfileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteArtistProfileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.artist.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteArtistProfileRequest clone() => DeleteArtistProfileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteArtistProfileRequest copyWith(void Function(DeleteArtistProfileRequest) updates) => super.copyWith((message) => updates(message as DeleteArtistProfileRequest)) as DeleteArtistProfileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteArtistProfileRequest create() => DeleteArtistProfileRequest._();
  DeleteArtistProfileRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteArtistProfileRequest> createRepeated() => $pb.PbList<DeleteArtistProfileRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteArtistProfileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteArtistProfileRequest>(create);
  static DeleteArtistProfileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class DeleteArtistProfileResponse extends $pb.GeneratedMessage {
  factory DeleteArtistProfileResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  DeleteArtistProfileResponse._() : super();
  factory DeleteArtistProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteArtistProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteArtistProfileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.artist.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteArtistProfileResponse clone() => DeleteArtistProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteArtistProfileResponse copyWith(void Function(DeleteArtistProfileResponse) updates) => super.copyWith((message) => updates(message as DeleteArtistProfileResponse)) as DeleteArtistProfileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteArtistProfileResponse create() => DeleteArtistProfileResponse._();
  DeleteArtistProfileResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteArtistProfileResponse> createRepeated() => $pb.PbList<DeleteArtistProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteArtistProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteArtistProfileResponse>(create);
  static DeleteArtistProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class ArtistServiceApi {
  $pb.RpcClient _client;
  ArtistServiceApi(this._client);

  $async.Future<CreateArtistProfileResponse> createArtistProfile($pb.ClientContext? ctx, CreateArtistProfileRequest request) =>
    _client.invoke<CreateArtistProfileResponse>(ctx, 'ArtistService', 'CreateArtistProfile', request, CreateArtistProfileResponse())
  ;
  $async.Future<GetArtistProfileResponse> getArtistProfile($pb.ClientContext? ctx, GetArtistProfileRequest request) =>
    _client.invoke<GetArtistProfileResponse>(ctx, 'ArtistService', 'GetArtistProfile', request, GetArtistProfileResponse())
  ;
  $async.Future<DeleteArtistProfileResponse> deleteArtistProfile($pb.ClientContext? ctx, DeleteArtistProfileRequest request) =>
    _client.invoke<DeleteArtistProfileResponse>(ctx, 'ArtistService', 'DeleteArtistProfile', request, DeleteArtistProfileResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
