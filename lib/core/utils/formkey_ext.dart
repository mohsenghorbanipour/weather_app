import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

extension FormKeyExt on GlobalKey<FormBuilderState> {
  bool isValid() => currentState?.saveAndValidate() ?? false;
  String getValue(String name) => currentState?.value[name] as String? ?? '';
}
