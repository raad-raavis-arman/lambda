import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/logger/logger.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/di_service.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/login/presentation/bloc/login_bloc.dart';
import 'package:landa/screens/verify_login/presentation/bloc/bloc.dart';
import 'package:toastification/toastification.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.login,
        name: RouteNames.login,
        pageBuilder: (context, state) {
          return FadeTransitionPage(
            child: const LoginPage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        userOtp: locator.get(),
      ),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> with MobileNumberValidator {
  late final GlobalKey<FormState> formKey;
  String validatedMobileNumber = '';

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginOtpSentState) {
          logger.i('LoginOtpSentState');
          Toastification().show(
            context: context,
            type: ToastificationType.success,
            title: MText(text: context.l10n.success),
            description: MText(
              text: '${context.l10n.otpSentSuccessfully} ${state.otpCode}',
            ),
          );
          context.read<OtpTimerBloc>().add(OtpTimerStartEvent());
          context.pushNamed(
            RouteNames.verifyLogin,
            extra: validatedMobileNumber,
          );
        } else if (state is LoginFailureState) {
          Toastification().show(
            context: context,
            type: ToastificationType.error,
            title: MText(text: context.l10n.error),
            description: MText(text: context.l10n.sthWentWrong),
          );
        }
      },
      child: MScaffold(
        key: WidgetKeys.loginScreen,
        appBar: AppBar(
          centerTitle: true,
          title: MText(text: context.l10n.login),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MText(
                text: context.l10n.loginTitle,
              ).paddingXL(),
              Form(
                key: formKey,
                child: TextFormField(
                  key: WidgetKeys.loginNumberInputField,
                  keyboardType: TextInputType.number,
                  maxLength: 13,
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.center,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: Theme.of(context).textTheme.titleMedium,
                  inputFormatters: [
                    if (context.isPersian)
                      TextFieldPersianFormatter()
                    else
                      TextFieldEnglishFormatter(),
                  ],
                  decoration: const InputDecoration(
                    isDense: true,
                    counterText: '',
                  ),
                  onSaved: (mobileNumber) {
                    validatedMobileNumber = mobileNumber ?? '';
                  },
                  validator: (mobileNumber) {
                    if (validateMobileNumber(mobileNumber ?? '')) {
                      return null;
                    } else {
                      return context.l10n.pleaseEnterValidMobileNumber;
                    }
                  },
                ),
              ).paddingXL(),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginProgressState) {
                    return const CircularProgressIndicator();
                  } else {
                    return SizedBox(
                      width: double.infinity,
                      child: BlocBuilder<OtpTimerBloc, OtpTimerState>(
                        builder: (context, otpTimerState) {
                          return ElevatedButton(
                            key: WidgetKeys.loginNextButton,
                            onPressed: otpTimerState.timerFinished
                                ? () {
                                    final formValidated =
                                        formKey.currentState?.validate() ??
                                            false;
                                    if (formValidated) {
                                      formKey.currentState?.save();
                                      context.read<LoginBloc>().add(
                                            SendOtpEvent(
                                              mobileNumber:
                                                  validatedMobileNumber,
                                            ),
                                          );
                                    }
                                  }
                                : null,
                            child: MText(
                              text: otpTimerState.timerFinished
                                  ? context.l10n.next
                                  : otpTimerState.remainedTimeFormattedString,
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ).paddingXL(),
            ],
          ).paddingM(),
        ),
      ),
    );
  }
}
