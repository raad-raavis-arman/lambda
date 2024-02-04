import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/network/network.dart';
import 'package:landa/core/utils/router/router.dart';
import 'package:landa/screens/login/data/datasources/datasources.dart';
import 'package:landa/screens/login/data/repositories/repositories.dart';
import 'package:landa/screens/login/domain/usecases/usecases.dart';
import 'package:landa/screens/login/presentation/bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        userOtp: UserOtpUsescase(
          userOtpRepository: UserOtpRepositoryImpl(
            otpRemoteDataSource: OtpRemoteDataSourceImpl(
              restClientService: RestClientServiceImpl(),
            ),
          ),
        ),
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

class _LoginViewState extends State<_LoginView> {
  late final TextEditingController otpTextController;

  @override
  void initState() {
    otpTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginOtpSentState) {
          // TODO(Taleb): show a Toast and tell user that otp sent successfully
          context.pushNamed(
            RouteNames.verifyLogin,
            extra: otpTextController.text,
          );
        } else if (state is LoginFailureState) {
          // TODO(Taleb): show an alert and show user error message
        }
      },
      child: Scaffold(
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
              TextField(
                controller: otpTextController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<LoginBloc>().add(
                        SendOtpEvent(
                          mobileNumber: otpTextController.text,
                        ),
                      );
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginProgressState) {
                      return const CircularProgressIndicator();
                    } else {
                      return const Text('بعدی');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
