import 'package:form_builder_validators/form_builder_validators.dart';

typedef Validator = String? Function(dynamic param);

class FormValidators {
  static Validator required() => FormBuilderValidators.required(
        errorText: 'required',
      );

  static String? phoneNumber(String? text) =>
      RegExp('^09\\d{9}\$').hasMatch(text ?? '') ? null : 'Wrong Phone';
}
