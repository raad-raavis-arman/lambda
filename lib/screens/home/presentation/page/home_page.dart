import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/screens/home/presentation/presentation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static GoRouterPageBuilder get routeBuilder => (context, state) {
        return const NoTransitionPage(
          child: HomePage(),
        );
      };

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (_, __) {
          return const AdvertisementItem();
        },
      ),
    );
  }
}
