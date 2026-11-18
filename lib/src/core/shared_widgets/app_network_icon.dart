import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invit/src/infrastructure/api/endpoint/services_urls.dart';

/// An icon image from the backend (`/files/...`), SVG or raster, shown in
/// [color] when it is an SVG. Shows [fallback] while it loads, when there is
/// no image and when it fails to load, so its place is never empty.
class AppNetworkIcon extends StatelessWidget {
  const AppNetworkIcon({
    super.key,
    required this.path,
    required this.size,
    required this.fallback,
    this.color,
  });

  final String? path;
  final double size;
  final Widget fallback;
  final Color? color;

  static const String _svgExtension = '.svg';

  static String? _urlOf(String? path) {
    final imagePath = path?.trim() ?? '';
    if (imagePath.isEmpty) return null;
    return ServicesUrls.imageUrl + imagePath;
  }

  static bool _isSvg(String url) =>
      url.toLowerCase().split('?').first.endsWith(_svgExtension);

  /// Downloads the icon into the cache ahead of time so it shows at once when
  /// its widget is built. Failures are ignored: the widget shows [fallback].
  static Future<void> precache(BuildContext context, String? path) async {
    final url = _urlOf(path);
    if (url == null) return;
    try {
      if (_isSvg(url)) {
        await SvgNetworkLoader(url).loadBytes(context);
      } else {
        await precacheImage(CachedNetworkImageProvider(url), context);
      }
    } catch (_) {
      // The icon falls back to [fallback] when it is built.
    }
  }

  @override
  Widget build(BuildContext context) {
    final url = _urlOf(path);
    if (url == null) return fallback;
    if (_isSvg(url)) {
      return SvgPicture.network(
        url,
        width: size,
        height: size,
        colorFilter: color == null
            ? null
            : ColorFilter.mode(color!, BlendMode.srcIn),
        placeholderBuilder: (_) => fallback,
        errorBuilder: (_, _, _) => fallback,
      );
    }
    return CachedNetworkImage(
      imageUrl: url,
      width: size,
      height: size,
      fit: BoxFit.contain,
      fadeInDuration: Duration.zero,
      placeholder: (_, _) => fallback,
      errorWidget: (_, _, _) => fallback,
    );
  }
}
