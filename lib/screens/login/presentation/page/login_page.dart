import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/router/router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/di_service.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/l10n/lang/lang_bloc.dart';
import 'package:landa/screens/login/presentation/bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<LoginBloc>(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> with MobileNumberValidator {
  late final GlobalKey<FormState> formKey;
  String validatedMobileNumber = '';

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final languageCode = context.read<LangBloc>().state.locale.languageCode;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginOtpSentState) {
          // TODO(Taleb): show a Toast and tell user that otp sent successfully
          context.pushNamed(
            RouteNames.verifyLogin,
            extra: validatedMobileNumber,
          );
        } else if (state is LoginFailureState) {
          // TODO(Taleb): show an alert and show user error message
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.login),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.l10n.loginTitle,
              ),
              const SizedBox(
                height: 80,
              ),
              Form(
                key: formKey,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 13,
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.center,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    if (languageCode == 'fa')
                      TextFieldPersianFormatter()
                    else
                      TextFieldEnglishFormatter(),
                  ],
                  decoration: const InputDecoration(
                    isDense: true,
                  ),
                  onSaved: (mobileNumber) {
                    validatedMobileNumber = mobileNumber ?? '';
                  },
                  validator: (mobileNumber) {
                    if (validateMobileNumber(mobileNumber ?? '')) {
                      return null;
                    } else {
                      return '';
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  final formValidated =
                      formKey.currentState?.validate() ?? false;
                  if (formValidated) {
                    formKey.currentState?.save();
                    context.read<LoginBloc>().add(
                          SendOtpEvent(
                            mobileNumber: validatedMobileNumber,
                          ),
                        );
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginProgressState) {
                      return const CircularProgressIndicator();
                    } else {
                      return Text(context.l10n.next);
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
