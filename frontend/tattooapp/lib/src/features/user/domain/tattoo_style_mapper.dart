import 'package:tattooapp/src/features/user/domain/user.dart';
import 'package:tattooapp/gen/dart/tattooapp/user/v1/user.pb.dart' as proto;

proto.TattooStyle mapTattooStyleToProtoStyle(TattooStyles style) {
  switch (style) {
    case TattooStyles.americanTraditional:
      return proto.TattooStyle.TATTOO_STYLE_AMERICAN_TRADITIONAL;
    case TattooStyles.japaneseTraditional:
      return proto.TattooStyle.TATTOO_STYLE_JAPANESE_TRADITIONAL;
    case TattooStyles.realism:
      return proto.TattooStyle.TATTOO_STYLE_REALISM;
    case TattooStyles.watercolor:
      return proto.TattooStyle.TATTOO_STYLE_WATER_COLOR;
  }
}

TattooStyles mapProtoStyleToTattooStyle(proto.TattooStyle style) {
  switch (style) {
    case proto.TattooStyle.TATTOO_STYLE_AMERICAN_TRADITIONAL:
      return TattooStyles.americanTraditional;
    case proto.TattooStyle.TATTOO_STYLE_JAPANESE_TRADITIONAL:
      return TattooStyles.japaneseTraditional;
    case proto.TattooStyle.TATTOO_STYLE_REALISM:
      return TattooStyles.realism;
    case proto.TattooStyle.TATTOO_STYLE_WATER_COLOR:
      return TattooStyles.watercolor;
    default:
      return TattooStyles.americanTraditional; // Default case
  }
}
