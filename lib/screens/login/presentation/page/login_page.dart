import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/router/router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'برای ورود و استفاده از خدمات\nشماره تلفن خود را وارد نمایید',
            ),
            const SizedBox(
              height: 80,
            ),
            const TextField(
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (_) => const VerifyLoginPage(),
                // ));
                context.pushNamed(RouteNames.verifyLogin, extra: '09377729207');
              },
              child: const Text('بعدی'),
            ),
          ],
        ),
      ),
    );
  }
}
