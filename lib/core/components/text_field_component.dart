import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:weather_app/core/theme/style/color_palatte.dart';
import 'package:intl/intl.dart' as intl;

// ignore: must_be_immutable
class TextFieldComponent extends StatefulWidget {
  final String name;
  final String? hintText;
  final String? labelText;
  final Widget? endLableText;
  final String? initialValue;
  final int maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final bool expands;
  final bool obscure;
  final bool requiredField;
  final bool readOnly;
  final bool enabled;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final double borderRadius;
  final bool radiusTopLeft;
  final bool radiusTopRight;
  final bool radiusBottomLeft;
  final bool radiusBottomRight;
  final Color? borderColor;
  final TextAlign textAlign;
  TextStyle? errorStyle;
  final TextStyle? style;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final List<String? Function(String?)> validators;
  final bool showLabel;
  final bool autofocus;
  final TextDirection? textDirection;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String?)? onFieldSubmitted;
  final Function(dynamic)? onChanged;
  final Function(dynamic)? onSaved;
  final Function? onEditingComplete;
  final Function? onTap;
  final bool dynamicPrefix;
  final EdgeInsets? contentPadding;
  final Color? fillColor;
  final TextDirection? hintDirection;
  final TextStyle? lableStyle;
  final bool? showCounter;
  final int? startLength;
  final String? descriptionTitle;

  TextFieldComponent({
    required this.name,
    this.hintText,
    this.labelText,
    this.endLableText,
    this.fillColor,
    this.initialValue,
    this.textInputAction,
    this.keyboardType,
    this.suffixIcon,
    this.autofillHints,
    this.contentPadding,
    this.focusNode,
    this.textDirection,
    this.onFieldSubmitted,
    this.onChanged,
    this.onEditingComplete,
    this.onSaved,
    this.inputFormatters,
    this.onTap,
    this.maxLength,
    this.errorStyle,
    this.lableStyle,
    this.textAlign = TextAlign.start,
    this.style,
    this.maxLines = 1,
    this.borderRadius = 12,
    this.expands = false,
    this.obscure = false,
    this.readOnly = false,
    this.enabled = true,
    this.requiredField = false,
    this.showLabel = true,
    this.validators = const <String Function(dynamic)>[],
    this.autofocus = false,
    this.dynamicPrefix = false,
    this.controller,
    this.radiusTopLeft = true,
    this.radiusTopRight = true,
    this.radiusBottomLeft = true,
    this.radiusBottomRight = true,
    this.borderColor,
    this.prefixIcon,
    this.hintDirection,
    this.showCounter = false,
    this.startLength = 0,
    this.descriptionTitle,
    Key? key,
  }) : super(key: key);

  @override
  TextFieldComponentState createState() => TextFieldComponentState();
}

class TextFieldComponentState extends State<TextFieldComponent> {
  bool showText = true;
  String? text = 'آ';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.errorStyle ??=
        TextStyle(color: ColorPalette.of(context).red, fontSize: 10);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.expands == false && widget.showLabel)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: 4,
                    start: 4,
                    bottom:
                        (widget.descriptionTitle?.isNotEmpty ?? false) ? 0 : 8),
                child: Text(
                  '${widget.labelText} ${widget.requiredField ? '*' : ''}',
                  style: widget.lableStyle ??
                      Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if ((widget.descriptionTitle?.isEmpty ?? true) &&
                  widget.endLableText != null)
                widget.endLableText ?? const SizedBox(),
            ],
          ),
        if (widget.descriptionTitle?.isNotEmpty ?? false)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              widget.descriptionTitle ?? '',
              overflow: TextOverflow.visible,
              maxLines: 2,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ColorPalette.of(context).textPrimary,
                  ),
            ),
          ),
        if ((widget.descriptionTitle?.isNotEmpty ?? false) &&
            widget.endLableText != null)
          widget.endLableText ?? const SizedBox(),
        FormBuilderTextField(
          scrollPadding: EdgeInsets.zero,
          controller: widget.controller,
          name: widget.name,
          focusNode: widget.focusNode,
          maxLength: widget.maxLength,
          initialValue: widget.initialValue,
          inputFormatters: [
            ...(widget.inputFormatters ?? []),
          ],
          onSubmitted: widget.onFieldSubmitted,
          onChanged: (value) {
            setState(() {
              text = value;
            });
            widget.onChanged?.call(value);
          },
          // cursorColor: LiomTheme.isDark(context)
          //     ? ColorPalette.light.textSecoundry
          //     : null,
          enabled: widget.enabled,
          onSaved: widget.onSaved,
          onEditingComplete: widget.onEditingComplete as void Function()?,
          onTap: () {
            if (widget.controller != null) {
              if (widget.controller?.selection ==
                  TextSelection.fromPosition(TextPosition(
                      offset: (widget.controller?.text.length ?? 0) - 1))) {
                setState(() {
                  widget.controller?.selection = TextSelection.fromPosition(
                      TextPosition(
                          offset: widget.controller?.text.length ?? 0));
                });
              }
            }
            widget.onTap;
          },
          autofocus: widget.autofocus,
          textAlign: widget.textAlign,
          textInputAction: widget.textInputAction,
          expands: widget.expands,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscure ? showText : false,
          maxLines: widget.maxLines,
          enableInteractiveSelection: true,
          style: widget.style ??
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorPalette.of(context).textPrimary),
          readOnly: widget.readOnly,

          autofillHints: widget.autofillHints,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            counter: widget.showCounter ?? false
                ? Text('${widget.startLength ?? 0}/${widget.maxLength ?? 0}')
                : null,
            counterStyle: Theme.of(context).textTheme.bodySmall,
            suffixIcon: widget.suffixIcon,
            prefixIcon: (widget.dynamicPrefix || widget.prefixIcon != null)
                ? (widget.dynamicPrefix && widget.prefixIcon == null)
                    ? SizedBox(
                        width: widget.dynamicPrefix ? null : 0,
                        child: Text(
                          '${widget.labelText} ${widget.requiredField ? '*' : ''}',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: ColorPalette.of(context).textPrimary,
                                  ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : widget.prefixIcon
                : null,
            fillColor: widget.readOnly
                ? widget.fillColor ?? (ColorPalette.of(context).silver)
                : widget.fillColor ?? (ColorPalette.of(context).white),
            filled: true,
            counterText: '',
            hintText: widget.hintText,
            hintTextDirection: widget.hintDirection,
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorPalette.of(context).silver,
                ),
            contentPadding: widget.contentPadding ?? const EdgeInsets.all(12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: ColorPalette.of(context).silver,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: ColorPalette.of(context).silver,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: widget.readOnly
                  ? BorderSide.none
                  : BorderSide(
                      color: ColorPalette.of(context).red,
                      width: 1,
                    ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.of(context).red,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: widget.readOnly
                  ? BorderSide(
                      color: ColorPalette.of(context).silver,
                      width: 1,
                    )
                  : BorderSide(
                      color: ColorPalette.of(context).primary,
                      width: 1,
                    ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            errorStyle: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: ColorPalette.of(context).red),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          validator: FormBuilderValidators.compose(widget.validators),
        ),
      ],
    );
  }
}
