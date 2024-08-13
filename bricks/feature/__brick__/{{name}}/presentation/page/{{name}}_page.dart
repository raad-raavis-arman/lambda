import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});
  
   static GoRoute get route => GoRoute(
      path: RouteNames.{{name}},
      name: RouteNames.{{name}},
      pageBuilder: (context, state) {
        return const NoTransitionPage(
        child: {{name.pascalCase()}}Page(),
        );
      },
    );
  
  @override
  Widget build(BuildContext context) {
    return const _{{name.pascalCase()}}View();
  }
}

class _{{name.pascalCase()}}View extends StatelessWidget {
  const _{{name.pascalCase()}}View({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
