import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/di_service.dart';
import 'package:landa/screens/splash/presentation/bloc/bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.splash,
        name: RouteNames.splash,
        pageBuilder: (context, state) {
          return FadeTransitionPage(
            child: const SplashPage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(
        preferences: locator.get(),
      ),
      child: const _SplashView(),
    );
  }
}

class _SplashView extends StatefulWidget {
  const _SplashView();

  @override
  State<_SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<_SplashView>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _animation;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(
          SplashCheckAuthEvent(),
        );
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animation = Tween<double>(begin: -0.05, end: 0.05).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashAuthorizedState) {
          context.goNamed(RouteNames.dashboard);
        } else if (state is SplashNotAuthorizedState) {
          context.goNamed(RouteNames.login);
        }
      },
      child: MScaffold(
        body: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (_, __) {
              return Transform.scale(
                scale: 1 + _animation.value,
                child: Image.asset(
                  'assets/img/logo/splash-logo.png',
                  width: width * 0.4,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
