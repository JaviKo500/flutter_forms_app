import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New user', style: TextStyle()),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const FlutterLogo(
                size: 100,
              ),
              BlocProvider(
                create: (context) => RegisterCubit(),
                child: _RegisterForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    final username = registerCubit.state.username;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            onChange: registerCubit.usernameChange,
            label: 'Username',
            hintText: 'Jk name',
            prefixIcon: Icons.supervised_user_circle_rounded,
            errorMessage: username.errorMessage,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            onChange: registerCubit.emailChange,
            errorMessage: email.errorMessage,
            label: 'Email',
            hintText: 'example@mail.com',
            prefixIcon: Icons.email_rounded,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            onChange: registerCubit.passwordChange,
            label: 'Password',
            hintText: '*****',
            prefixIcon: Icons.lock,
            obscureText: true,
            errorMessage: password.errorMessage,
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
            onPressed: () {
              
              registerCubit.onSubmit();
            },
            label: const Text('Create user', style: TextStyle()),
            icon: const Icon(Icons.save),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
