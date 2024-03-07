import 'package:flutter/material.dart';
import 'package:weather_app/core/components/loading_component.dart';
import 'package:weather_app/core/theme/style/color_palatte.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    super.key,
    required this.onPressed,
    required this.child,
    this.width = double.infinity,
    this.borderRadius = 12,
    this.borderSide = BorderSide.none,
    this.enabled = true,
    this.loading = false,
    this.color,
    this.splashColor,
    this.loadingColor,
    this.maxWidth,
    this.minwidth,
    this.margin,
  });

  final double? width;
  final Widget child;
  final Function onPressed;
  final double borderRadius;
  final Color? color;
  final BorderSide borderSide;
  final bool enabled;
  final bool loading;
  final Color? splashColor;
  final Color? loadingColor;
  final double? maxWidth;
  final double? minwidth;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        height: 48,
        margin: margin,
        child: ElevatedButton(
          onPressed: !loading && enabled
              ? () {
                  // ignore: avoid_dynamic_calls
                  onPressed();
                  FocusScope.of(context).requestFocus(FocusNode());
                }
              : null,
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                backgroundColor: MaterialStateProperty.resolveWith((states) =>
                    states.contains(MaterialState.disabled)
                        ? Theme.of(context).disabledColor
                        : color ?? Theme.of(context).primaryColor),
                overlayColor: splashColor == null
                    ? null
                    : MaterialStateProperty.resolveWith((states) =>
                        states.contains(MaterialState.disabled)
                            ? Theme.of(context).disabledColor
                            : Theme.of(context).primaryColor.withOpacity(0.1)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: (enabled && !loading)
                        ? borderSide
                        : borderSide.copyWith(
                            color: ColorPalette.of(context).silver),
                  ),
                ),
                elevation: MaterialStateProperty.all(0),
              ),
          child: loading
              ? Center(
                  child: LoadingComponent(
                    color: loadingColor ?? ColorPalette.of(context).white,
                    size: 24,
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.only(bottom: 4.0), //!because of font
                  child: child,
                ),
        ),
      );
}
