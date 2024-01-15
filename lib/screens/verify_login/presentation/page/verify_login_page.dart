import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/router/router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyLoginPage extends StatelessWidget {
  const VerifyLoginPage({
    required this.mobileNumber,
    super.key,
  });

  final String mobileNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('کد تایید پیامک شده به $mobileNumber را وارد نمایید'),
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
              child: const Text('ورود'),
            ),
          ],
        ),
      ),
    );
  }
}
