import 'package:flutter/material.dart';
import 'package:landa/screens/home/home.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyLoginPage extends StatelessWidget {
  const VerifyLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('کد تایید پیامک شده را وارد نمایید'),
            const SizedBox(
              height: 100,
            ),
            PinCodeTextField(appContext: context, length: 4),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => const HomePage(),
                  ));
                },
                child: const Text('ورود'))
          ],
        ),
      ),
    );
  }
}
