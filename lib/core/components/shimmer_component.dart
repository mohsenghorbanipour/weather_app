import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/core/theme/style/weather_theme.dart';

class ShimmerComponent extends StatelessWidget {
  const ShimmerComponent(
      {super.key,
      this.height,
      this.width,
      this.margin = EdgeInsets.zero,
      this.radius = 10,
      this.mediaShowPage});
  final double? height;
  final double? width;
  final EdgeInsets margin;
  final double radius;
  final bool? mediaShowPage;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: mediaShowPage ?? false
          ? const Color(0x10FFFFFF)
          : (!WeatherTheme.isDark(context))
              ? const Color(0x10000000)
              : const Color(0x10FFFFFF),
      highlightColor: mediaShowPage ?? false
          ? const Color(0x20FFFFFF)
          : (!WeatherTheme.isDark(context))
              ? const Color(0x20000000)
              : const Color(0x20FFFFFF),
      direction: ShimmerDirection.rtl,
      child: Container(
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
