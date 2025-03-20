//
//  Generated code. Do not modify.
//  source: tattooapp/v1/artist.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $0;

class Artist extends $pb.GeneratedMessage {
  factory Artist({
    $core.int? artistId,
    $0.User? user,
    $core.String? style,
  }) {
    final $result = create();
    if (artistId != null) {
      $result.artistId = artistId;
    }
    if (user != null) {
      $result.user = user;
    }
    if (style != null) {
      $result.style = style;
    }
    return $result;
  }
  Artist._() : super();
  factory Artist.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Artist.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Artist', package: const $pb.PackageName(_omitMessageNames ? '' : 'tattooapp.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'artistId', $pb.PbFieldType.O3)
    ..aOM<$0.User>(2, _omitFieldNames ? '' : 'user', subBuilder: $0.User.create)
    ..aOS(3, _omitFieldNames ? '' : 'style')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Artist clone() => Artist()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Artist copyWith(void Function(Artist) updates) => super.copyWith((message) => updates(message as Artist)) as Artist;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Artist create() => Artist._();
  Artist createEmptyInstance() => create();
  static $pb.PbList<Artist> createRepeated() => $pb.PbList<Artist>();
  @$core.pragma('dart2js:noInline')
  static Artist getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Artist>(create);
  static Artist? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get artistId => $_getIZ(0);
  @$pb.TagNumber(1)
  set artistId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasArtistId() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtistId() => clearField(1);

  @$pb.TagNumber(2)
  $0.User get user => $_getN(1);
  @$pb.TagNumber(2)
  set user($0.User v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  $0.User ensureUser() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get style => $_getSZ(2);
  @$pb.TagNumber(3)
  set style($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStyle() => $_has(2);
  @$pb.TagNumber(3)
  void clearStyle() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
