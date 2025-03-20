//
//  Generated code. Do not modify.
//  source: tattooapp/v1/artist_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $0;

class LinkInstagramAccountRequest extends $pb.GeneratedMessage {
  factory LinkInstagramAccountRequest({
    $0.User? user,
    $core.String? instagramHandle,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    if (instagramHandle != null) {
      $result.instagramHandle = instagramHandle;
    }
    return $result;
  }
  LinkInstagramAccountRequest._() : super();
  factory LinkInstagramAccountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LinkInstagramAccountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LinkInstagramAccountRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.v1'), createEmptyInstance: create)
    ..aOM<$0.User>(1, _omitFieldNames ? '' : 'user', subBuilder: $0.User.create)
    ..aOS(2, _omitFieldNames ? '' : 'instagramHandle')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LinkInstagramAccountRequest clone() => LinkInstagramAccountRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LinkInstagramAccountRequest copyWith(void Function(LinkInstagramAccountRequest) updates) => super.copyWith((message) => updates(message as LinkInstagramAccountRequest)) as LinkInstagramAccountRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LinkInstagramAccountRequest create() => LinkInstagramAccountRequest._();
  LinkInstagramAccountRequest createEmptyInstance() => create();
  static $pb.PbList<LinkInstagramAccountRequest> createRepeated() => $pb.PbList<LinkInstagramAccountRequest>();
  @$core.pragma('dart2js:noInline')
  static LinkInstagramAccountRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LinkInstagramAccountRequest>(create);
  static LinkInstagramAccountRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $0.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  $0.User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get instagramHandle => $_getSZ(1);
  @$pb.TagNumber(2)
  set instagramHandle($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInstagramHandle() => $_has(1);
  @$pb.TagNumber(2)
  void clearInstagramHandle() => clearField(2);
}

class LinkInstagramAccountResponse extends $pb.GeneratedMessage {
  factory LinkInstagramAccountResponse({
    $core.String? instagramHandle,
  }) {
    final $result = create();
    if (instagramHandle != null) {
      $result.instagramHandle = instagramHandle;
    }
    return $result;
  }
  LinkInstagramAccountResponse._() : super();
  factory LinkInstagramAccountResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LinkInstagramAccountResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LinkInstagramAccountResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'instagramHandle')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LinkInstagramAccountResponse clone() => LinkInstagramAccountResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LinkInstagramAccountResponse copyWith(void Function(LinkInstagramAccountResponse) updates) => super.copyWith((message) => updates(message as LinkInstagramAccountResponse)) as LinkInstagramAccountResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LinkInstagramAccountResponse create() => LinkInstagramAccountResponse._();
  LinkInstagramAccountResponse createEmptyInstance() => create();
  static $pb.PbList<LinkInstagramAccountResponse> createRepeated() => $pb.PbList<LinkInstagramAccountResponse>();
  @$core.pragma('dart2js:noInline')
  static LinkInstagramAccountResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LinkInstagramAccountResponse>(create);
  static LinkInstagramAccountResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get instagramHandle => $_getSZ(0);
  @$pb.TagNumber(1)
  set instagramHandle($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInstagramHandle() => $_has(0);
  @$pb.TagNumber(1)
  void clearInstagramHandle() => clearField(1);
}

/// information needed to create an artist
class CreateArtistRequest extends $pb.GeneratedMessage {
  factory CreateArtistRequest({
    $core.int? userId,
    $core.String? style,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (style != null) {
      $result.style = style;
    }
    return $result;
  }
  CreateArtistRequest._() : super();
  factory CreateArtistRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateArtistRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateArtistRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'style')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateArtistRequest clone() => CreateArtistRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateArtistRequest copyWith(void Function(CreateArtistRequest) updates) => super.copyWith((message) => updates(message as CreateArtistRequest)) as CreateArtistRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateArtistRequest create() => CreateArtistRequest._();
  CreateArtistRequest createEmptyInstance() => create();
  static $pb.PbList<CreateArtistRequest> createRepeated() => $pb.PbList<CreateArtistRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateArtistRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateArtistRequest>(create);
  static CreateArtistRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get style => $_getSZ(1);
  @$pb.TagNumber(2)
  set style($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStyle() => $_has(1);
  @$pb.TagNumber(2)
  void clearStyle() => clearField(2);
}

/// response to creating an artist
class CreateArtistResponse extends $pb.GeneratedMessage {
  factory CreateArtistResponse({
    $core.int? artistId,
  }) {
    final $result = create();
    if (artistId != null) {
      $result.artistId = artistId;
    }
    return $result;
  }
  CreateArtistResponse._() : super();
  factory CreateArtistResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateArtistResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateArtistResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'artistId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateArtistResponse clone() => CreateArtistResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateArtistResponse copyWith(void Function(CreateArtistResponse) updates) => super.copyWith((message) => updates(message as CreateArtistResponse)) as CreateArtistResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateArtistResponse create() => CreateArtistResponse._();
  CreateArtistResponse createEmptyInstance() => create();
  static $pb.PbList<CreateArtistResponse> createRepeated() => $pb.PbList<CreateArtistResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateArtistResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateArtistResponse>(create);
  static CreateArtistResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get artistId => $_getIZ(0);
  @$pb.TagNumber(1)
  set artistId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasArtistId() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtistId() => clearField(1);
}

class ArtistServiceApi {
  $pb.RpcClient _client;
  ArtistServiceApi(this._client);

  $async.Future<LinkInstagramAccountResponse> linkInstagramAccount($pb.ClientContext? ctx, LinkInstagramAccountRequest request) =>
    _client.invoke<LinkInstagramAccountResponse>(ctx, 'ArtistService', 'LinkInstagramAccount', request, LinkInstagramAccountResponse())
  ;
  $async.Future<CreateArtistResponse> createArtist($pb.ClientContext? ctx, CreateArtistRequest request) =>
    _client.invoke<CreateArtistResponse>(ctx, 'ArtistService', 'CreateArtist', request, CreateArtistResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
