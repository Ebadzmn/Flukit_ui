import 'package:flutter/material.dart';
import '../helpers/edge_insets.dart';

/// Lightweight, readable alias for Flutter images with border-radius support.
///
/// Example:
/// ```dart
/// img('assets/photo.png', w: 100, h: 100, rad: 12)
/// img.net('https://example.com/pic.jpg', w: 100, h: 100, rad: 50)
/// img.asset('assets/logo.png', w: 48, h: 48)
/// ```
class img extends StatelessWidget {
  /// The image provider
  final ImageProvider image;

  /// Width
  final double? w;

  /// Height
  final double? h;

  /// Border radius (accepts `double`, `int`, or [BorderRadius])
  final dynamic rad;

  /// BoxFit
  final BoxFit? fit;

  /// Alignment
  final AlignmentGeometry ali;

  /// Color blend filter
  final Color? cl;

  /// Color blend mode
  final BlendMode? blend;

  /// Error widget builder
  final ImageErrorWidgetBuilder? errorBuilder;

  /// Frame builder
  final ImageFrameBuilder? frameBuilder;

  /// Semantic label
  final String? semanticLabel;

  /// Filter quality
  final FilterQuality filterQuality;

  img(
    String src, {
    super.key,
    this.w,
    this.h,
    this.rad,
    this.fit = BoxFit.cover,
    this.ali = Alignment.center,
    this.cl,
    this.blend,
    this.errorBuilder,
    this.frameBuilder,
    this.semanticLabel,
    this.filterQuality = FilterQuality.low,
  }) : image = _resolveImageProvider(src);

  /// Creates a network image.
  img.net(
    String url, {
    super.key,
    this.w,
    this.h,
    this.rad,
    this.fit = BoxFit.cover,
    this.ali = Alignment.center,
    this.cl,
    this.blend,
    this.errorBuilder,
    this.frameBuilder,
    this.semanticLabel,
    this.filterQuality = FilterQuality.low,
    Map<String, String>? headers,
    double scale = 1.0,
  }) : image = NetworkImage(url, scale: scale, headers: headers);

  /// Creates an asset image.
  img.asset(
    String name, {
    super.key,
    this.w,
    this.h,
    this.rad,
    this.fit = BoxFit.cover,
    this.ali = Alignment.center,
    this.cl,
    this.blend,
    this.errorBuilder,
    this.frameBuilder,
    this.semanticLabel,
    this.filterQuality = FilterQuality.low,
    AssetBundle? bundle,
    String? package,
  }) : image = AssetImage(name, bundle: bundle, package: package);

  /// Directly from [ImageProvider].
  const img.provider(
    this.image, {
    super.key,
    this.w,
    this.h,
    this.rad,
    this.fit = BoxFit.cover,
    this.ali = Alignment.center,
    this.cl,
    this.blend,
    this.errorBuilder,
    this.frameBuilder,
    this.semanticLabel,
    this.filterQuality = FilterQuality.low,
  });

  static ImageProvider _resolveImageProvider(String src) {
    if (src.startsWith('http://') || src.startsWith('https://')) {
      return NetworkImage(src);
    }
    return AssetImage(src);
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = Image(
      image: image,
      width: w,
      height: h,
      fit: fit,
      alignment: ali,
      color: cl,
      colorBlendMode: blend,
      errorBuilder: errorBuilder,
      frameBuilder: frameBuilder,
      semanticLabel: semanticLabel,
      filterQuality: filterQuality,
    );

    final BorderRadius? resolved = resolveRadius(rad);
    if (resolved != null) {
      return ClipRRect(
        borderRadius: resolved,
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}
