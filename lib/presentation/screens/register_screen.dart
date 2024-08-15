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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({super.key});

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            onChange: (value) {
              registerCubit.usernameChange(value);
              _formKey.currentState!.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) return 'Field is required';
              if (value.trim().isEmpty) return 'Field is required';
              if (value.trim().length < 6) return 'Requires min 6 characters';
              return null;
            },
            label: 'Username',
            hintText: 'Jk name',
            prefixIcon: Icons.supervised_user_circle_rounded,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            onChange: (value) {
              registerCubit.emailChange(value);
              _formKey.currentState!.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) return 'Field is required';
              if (value.trim().isEmpty) return 'Field is required';
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              if (!emailRegExp.hasMatch(value)) return 'Email is invalid';
              return null;
            },
            label: 'Email',
            hintText: 'example@mail.com',
            prefixIcon: Icons.email_rounded,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            onChange: (value) {
              registerCubit.passwordChange(value);
              _formKey.currentState!.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) return 'Field is required';
              if (value.trim().isEmpty) return 'Field is required';
              if (value.trim().length < 6) return 'Requires min 6 characters';
              return null;
            },
            label: 'Password',
            hintText: '*****',
            prefixIcon: Icons.lock,
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (!isValid) return;
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
