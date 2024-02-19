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

  @override
  Widget build(BuildContext context) {
    final languageCode = context.read<LangBloc>().state.locale.languageCode;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.otpVerifyTitle(
                languageCode == 'fa'
                    ? mobileNumber.replaceEnNumToFa()
                    : mobileNumber.replaceFaNumToEn(),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            PinCodeTextField(appContext: context, length: 4),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(RouteNames.home);
              },
              child: Text(context.l10n.login),
            ),
          ],
        ),
      ),
    );
  }
}
