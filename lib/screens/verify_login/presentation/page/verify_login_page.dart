import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/di_service.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/l10n/lang/lang_bloc.dart';
import 'package:landa/screens/verify_login/presentation/bloc/bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyLoginPage extends StatelessWidget {
  const VerifyLoginPage({
    required this.mobileNumber,
    super.key,
  });

  final String mobileNumber;

  static GoRouterPageBuilder get routeBuilder => (context, state) {
        final mobileNumber = state.extra as String?;
        if (mobileNumber == null) {
          throw Exception('Mobile number must not be null');
        }
        return NoTransitionPage(
          child: VerifyLoginPage(
            mobileNumber: mobileNumber,
          ),
        );
      };

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
    final isPersian = context.read<LangBloc>().state.isPersian;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.otpVerifyTitle(
                    isPersian
                        ? widget.mobileNumber.replaceEnNumToFa()
                        : widget.mobileNumber.replaceFaNumToEn(),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    context.l10n.editMobileNumber,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
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
                    if (isPersian)
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
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        formKey.currentState?.save();
                        context.read<VerifyLoginBloc>().add(
                              AuthenticateLoginEvent(
                                otp: otpCode.replaceFaNumToEn(),
                                mobileNumber:
                                    widget.mobileNumber.replaceFaNumToEn(),
                              ),
                            );
                      }
                      //context.goNamed(RouteNames.home);
                    },
                    child: Text(context.l10n.login),
                  ),
                ),
                const SizedBox().paddingS(),
                BlocBuilder<OtpTimerBloc, OtpTimerState>(
                  builder: (context, state) {
                    return OutlinedButton(
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
                      child: Text(
                        state.timerFinished
                            ? context.l10n.sendCode
                            : isPersian
                                ? state.remainedTimeFormattedString
                                    .replaceEnNumToFa()
                                : state.remainedTimeFormattedString
                                    .replaceFaNumToEn(),
                      ),
                    );
                  },
                ),
              ],
            ).paddingXL(),
          ],
        ).paddingM(),
      ),
    );
  }
}
