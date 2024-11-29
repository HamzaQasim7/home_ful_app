import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_ful/core/constants/constants.dart';

class SharedDynamicIcon extends StatelessWidget {
  final Color? color;
  final double height;
  final double? width;
  final dynamic path;
  final double? fill;
  final double? weight;
  final BoxFit? fit;

  const SharedDynamicIcon(
    this.path, {
    super.key,
    this.color,
    this.height = Sizes.s16,
    this.fill,
    this.weight,
    this.fit,
    this.width,
  });

  bool _isNetworkImage(String url) {
    return url.startsWith('http://') || url.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    return path is String && path.toString().endsWith('.svg')
        ? SvgPicture.asset(
            path,
            height: height,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
          )
        : path is String && path.toString().endsWith('.png')
            ? Image.asset(
                path,
                height: height,
                width: width,
                fit: fit,
              )
            : path is String && _isNetworkImage(path)
                ? Image.network(
                    path,
                    height: height,
                    width: width,
                    fit: fit,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.broken_image, color: Colors.red),
                      );
                    },
                  )
                : Icon(
                    path,
                    size: height,
                    color: color,
                    weight: weight,
                    fill: fill,
                  );
  }
}
