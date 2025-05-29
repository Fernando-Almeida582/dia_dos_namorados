/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/capa_little_talks.png
  AssetGenImage get capaLittleTalks =>
      const AssetGenImage('assets/images/capa_little_talks.png');

  /// File path: assets/images/imagem_1.jpg
  AssetGenImage get imagem1 =>
      const AssetGenImage('assets/images/imagem_1.jpg');

  /// File path: assets/images/imagem_10.jpg
  AssetGenImage get imagem10 =>
      const AssetGenImage('assets/images/imagem_10.jpg');

  /// File path: assets/images/imagem_11.jpg
  AssetGenImage get imagem11 =>
      const AssetGenImage('assets/images/imagem_11.jpg');

  /// File path: assets/images/imagem_12.jpg
  AssetGenImage get imagem12 =>
      const AssetGenImage('assets/images/imagem_12.jpg');

  /// File path: assets/images/imagem_13.jpg
  AssetGenImage get imagem13 =>
      const AssetGenImage('assets/images/imagem_13.jpg');

  /// File path: assets/images/imagem_14.jpg
  AssetGenImage get imagem14 =>
      const AssetGenImage('assets/images/imagem_14.jpg');

  /// File path: assets/images/imagem_15.jpg
  AssetGenImage get imagem15 =>
      const AssetGenImage('assets/images/imagem_15.jpg');

  /// File path: assets/images/imagem_2.jpg
  AssetGenImage get imagem2 =>
      const AssetGenImage('assets/images/imagem_2.jpg');

  /// File path: assets/images/imagem_3.jpg
  AssetGenImage get imagem3 =>
      const AssetGenImage('assets/images/imagem_3.jpg');

  /// File path: assets/images/imagem_4.jpg
  AssetGenImage get imagem4 =>
      const AssetGenImage('assets/images/imagem_4.jpg');

  /// File path: assets/images/imagem_5.jpg
  AssetGenImage get imagem5 =>
      const AssetGenImage('assets/images/imagem_5.jpg');

  /// File path: assets/images/imagem_6.jpg
  AssetGenImage get imagem6 =>
      const AssetGenImage('assets/images/imagem_6.jpg');

  /// File path: assets/images/imagem_7.png
  AssetGenImage get imagem7 =>
      const AssetGenImage('assets/images/imagem_7.png');

  /// File path: assets/images/imagem_8.jpg
  AssetGenImage get imagem8 =>
      const AssetGenImage('assets/images/imagem_8.jpg');

  /// File path: assets/images/imagem_9.jpg
  AssetGenImage get imagem9 =>
      const AssetGenImage('assets/images/imagem_9.jpg');

  /// File path: assets/images/splash_login.png
  AssetGenImage get splashLogin =>
      const AssetGenImage('assets/images/splash_login.png');

  /// File path: assets/images/splash_login_2.png
  AssetGenImage get splashLogin2 =>
      const AssetGenImage('assets/images/splash_login_2.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    capaLittleTalks,
    imagem1,
    imagem10,
    imagem11,
    imagem12,
    imagem13,
    imagem14,
    imagem15,
    imagem2,
    imagem3,
    imagem4,
    imagem5,
    imagem6,
    imagem7,
    imagem8,
    imagem9,
    splashLogin,
    splashLogin2,
  ];
}

class $AssetsMusicsGen {
  const $AssetsMusicsGen();

  /// File path: assets/musics/little_talks.mp3
  String get littleTalks => 'assets/musics/little_talks.mp3';

  /// List of all assets
  List<String> get values => [littleTalks];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsMusicsGen musics = $AssetsMusicsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
