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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({super.key});

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            onChange: (value) => username = value,
            validator: (value) {
              if ( value == null || value.isEmpty ) return 'Field is required';
              if ( value.trim().isEmpty ) return 'Field is required';
              if ( value.trim().length < 6 ) return 'Requires min 6 characters';
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
            onChange: (value) => email = value,
            validator: (value) {
              if ( value == null || value.isEmpty ) return 'Field is required';
              if ( value.trim().isEmpty ) return 'Field is required';
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              if ( !emailRegExp.hasMatch( value ) ) return 'Email is invalid';
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
            onChange: (value) => password = value,
            validator: (value) {
              if ( value == null || value.isEmpty ) return 'Field is required';
              if ( value.trim().isEmpty ) return 'Field is required';
              if ( value.trim().length < 6 ) return 'Requires min 6 characters';
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
              if ( !isValid ) return; 
              print(username);
              print(email);
              print(password);
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
