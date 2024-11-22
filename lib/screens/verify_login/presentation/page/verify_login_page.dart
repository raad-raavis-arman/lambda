import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/di_service.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/verify_login/presentation/bloc/bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:toastification/toastification.dart';

class VerifyLoginPage extends StatelessWidget {
  const VerifyLoginPage({
    required this.mobileNumber,
    super.key,
  });

  final String mobileNumber;

  static GoRoute get route => GoRoute(
        path: RouteNames.verifyLogin,
        name: RouteNames.verifyLogin,
        pageBuilder: (context, state) {
          final mobileNumber = state.extra as String?;
          if (mobileNumber == null) {
            throw Exception('Mobile number must not be null');
          }
          return SlideTransitionPage(
            child: VerifyLoginPage(
              mobileNumber: mobileNumber,
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyLoginBloc(
        userLoginUsescase: locator.get(),
        userOtpUsescase: locator.get(),
      ),
      child: _VerifyLoginView(
        mobileNumber: mobileNumber,
      ),
    );
  }
}

class _VerifyLoginView extends StatefulWidget {
  const _VerifyLoginView({
    required this.mobileNumber,
  });

  final String mobileNumber;

  @override
  State<_VerifyLoginView> createState() => _VerifyLoginViewState();
}

class _VerifyLoginViewState extends State<_VerifyLoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String otpCode = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyLoginBloc, VerifyLoginState>(
      listener: (context, state) {
        if (state is VerifyLoginSuccessState) {
          context.goNamed(RouteNames.dashboard);
        } else if (state is VerifyLoginFailState) {
          Toastification().show(
            context: context,
            type: ToastificationType.error,
            title: MText(text: context.l10n.error),
            description: MText(text: context.l10n.sthWentWrong),
          );
        } else if (state is VerifyLoginOtpFailState) {
          Toastification().show(
            context: context,
            type: ToastificationType.error,
            title: MText(text: context.l10n.error),
            description: MText(text: context.l10n.failedToSendOtp),
          );
        } else if (state is VerifyLoginOtpSuccessState) {
          Toastification().show(
            context: context,
            type: ToastificationType.error,
            title: MText(text: context.l10n.success),
            description: MText(text: context.l10n.otpSentSuccessfully),
          );
        }
      },
      child: MScaffold(
        key: WidgetKeys.verifyLoginScreen,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MText(
                    text: context.l10n.otpVerifyTitle(
                      widget.mobileNumber,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: MText(
                      text: context.l10n.editMobileNumber,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ],
              ).paddingL(),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Form(
                  key: formKey,
                  child: PinCodeTextField(
                    key: WidgetKeys.verifyLoginOtpInputField,
                    appContext: context,
                    length: 6,
                    keyboardType: TextInputType.number,
                    onSaved: (newValue) => otpCode = newValue ?? '',
                    validator: (value) {
                      if (value?.trim().length == 6) {
                        return null;
                      } else {
                        return '';
                      }
                    },
                    inputFormatters: [
                      if (context.isPersian)
                        TextFieldPersianFormatter()
                      else
                        TextFieldEnglishFormatter(),
                    ],
                    pinTheme: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? darkPinTheme
                        : lightPinTheme,
                  ).paddingXL(),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<VerifyLoginBloc, VerifyLoginState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          key: WidgetKeys.verifyLoginNextButton,
                          onPressed: state is VerifyLoginLoadingState
                              ? null
                              : () {
                                  if (formKey.currentState?.validate() ??
                                      false) {
                                    formKey.currentState?.save();
                                    context.read<VerifyLoginBloc>().add(
                                          AuthenticateLoginEvent(
                                            otp: otpCode.replaceFaNumToEn(),
                                            mobileNumber: widget.mobileNumber
                                                .replaceFaNumToEn(),
                                          ),
                                        );
                                  }
                                },
                          child: state is VerifyLoginLoadingState
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                ).paddingXS()
                              : MText(text: context.l10n.login),
                        );
                      },
                    ),
                  ),
                  const SizedBox().paddingS(),
                  BlocBuilder<OtpTimerBloc, OtpTimerState>(
                    builder: (context, state) {
                      return OutlinedButton(
                        key: WidgetKeys.verifyLoginResendButton,
                        onPressed: state.timerFinished
                            ? () {
                                context
                                    .read<OtpTimerBloc>()
                                    .add(OtpTimerStartEvent());
                                context.read<VerifyLoginBloc>().add(
                                      ResendOtpEvent(
                                        mobileNumber: widget.mobileNumber,
                                      ),
                                    );
                              }
                            : null,
                        child: MText(
                          text: state.timerFinished
                              ? context.l10n.sendCode
                              : state.remainedTimeFormattedString,
                        ),
                      );
                    },
                  ),
                ],
              ).paddingXL(),
            ],
          ).paddingM(),
        ),
      ),
    );
  }
}
