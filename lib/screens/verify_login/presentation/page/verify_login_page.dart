import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/l10n/lang/lang_bloc.dart';
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
    return _VerifyLoginView(
      mobileNumber: mobileNumber,
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final languageCode = context.read<LangBloc>().state.locale.languageCode;
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
                    languageCode == 'fa'
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
                  inputFormatters: [
                    if (languageCode == 'fa')
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
                      context.goNamed(RouteNames.home);
                    },
                    child: Text(context.l10n.login),
                  ),
                ),
                const SizedBox().paddingS(),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(context.l10n.sendCode),
                ),
              ],
            ).paddingXL(),
          ],
        ).paddingM(),
      ),
    );
  }
}
