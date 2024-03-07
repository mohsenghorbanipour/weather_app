import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/components/button_component.dart';
import 'package:weather_app/core/components/text_field_component.dart';
import 'package:weather_app/core/router/routes.dart';
import 'package:weather_app/core/utils/form_validators.dart';
import 'package:weather_app/core/utils/formkey_ext.dart';
import 'package:weather_app/modules/auth/bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: FormBuilder(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldComponent(
                        name: 'phone',
                        labelText: 'Phone',
                        hintText: '09121234567',
                        validators: [
                          FormValidators.required(),
                          FormValidators.phoneNumber,
                        ],
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ButtonComponent(
                        onPressed: () async {
                          if (_formKey.isValid()) {
                            if (await Provider.of<AuthBloc>(context,
                                    listen: false)
                                .loginSendCode(
                              _formKey.getValue('phone'),
                            )) {
                              if (context.mounted) {
                                context.goNamed(Routes.otp);
                              }
                            }
                          }
                        },
                        loading: context
                            .select<AuthBloc, bool>((bloc) => bloc.loading),
                        child: const Text(
                          'Send Code',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
