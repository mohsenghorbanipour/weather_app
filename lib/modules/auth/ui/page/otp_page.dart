import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/components/button_component.dart';
import 'package:weather_app/core/components/pinput_component.dart';
import 'package:weather_app/core/components/toast_component.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/core/network/api_client.dart';
import 'package:weather_app/core/router/routes.dart';
import 'package:weather_app/modules/auth/bloc/auth_bloc.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PinPutComponent(
                      fieldCount: 6,
                      controller:
                          context.select<AuthBloc, TextEditingController>(
                              (bloc) => bloc.otpController),
                      onSubmit: (val) {},
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ButtonComponent(
                      onPressed: () async {
                        if (Provider.of<AuthBloc>(context, listen: false)
                                .otpController
                                .text
                                .length ==
                            6) {
                          if (await Provider.of<AuthBloc>(context,
                                  listen: false)
                              .loginValidateCode()) {
                            if (context.mounted) {
                              ApiClient().dio.options.baseUrl =
                                  Constants.weatherBaseUrl;
                              context.goNamed(Routes.weather);
                            }
                          }
                        } else {
                          ToastComponent.show(
                            'Enter Otp Code',
                            type: ToastType.toolTip,
                          );
                        }
                      },
                      loading: context
                          .select<AuthBloc, bool>((bloc) => bloc.loading),
                      child: const Text(
                        'login',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
