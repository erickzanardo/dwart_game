/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesDwarfGen get dwarf => const $AssetsImagesDwarfGen();
}

class $AssetsImagesDwarfGen {
  const $AssetsImagesDwarfGen();

  AssetGenImage get blacksmithApron =>
      const AssetGenImage('assets/images/dwarf/blacksmith_apron.png');
  AssetGenImage get blacksmithGlooves =>
      const AssetGenImage('assets/images/dwarf/blacksmith_glooves.png');
  AssetGenImage get blacksmithGooglesFace =>
      const AssetGenImage('assets/images/dwarf/blacksmith_googles_face.png');
  AssetGenImage get body => const AssetGenImage('assets/images/dwarf/body.png');
  AssetGenImage get face => const AssetGenImage('assets/images/dwarf/face.png');
  AssetGenImage get hammer =>
      const AssetGenImage('assets/images/dwarf/hammer.png');
  AssetGenImage get hand => const AssetGenImage('assets/images/dwarf/hand.png');
  AssetGenImage get hat => const AssetGenImage('assets/images/dwarf/hat.png');
  AssetGenImage get minerHat =>
      const AssetGenImage('assets/images/dwarf/miner_hat.png');
  AssetGenImage get pickaxe =>
      const AssetGenImage('assets/images/dwarf/pickaxe.png');
  AssetGenImage get tongs =>
      const AssetGenImage('assets/images/dwarf/tongs.png');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName)
      : super(assetName, package: 'dwart_components');

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
