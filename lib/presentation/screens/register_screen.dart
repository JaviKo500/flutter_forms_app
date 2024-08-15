import 'package:flutter/material.dart';
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
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
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
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Username',
            hintText: 'Jk name',
            prefixIcon: Icons.supervised_user_circle_rounded,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Email',
            hintText: 'example@mail.com',
            prefixIcon: Icons.email_rounded,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Password',
            hintText: '*****',
            prefixIcon: Icons.lock,
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
            onPressed: () {},
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
