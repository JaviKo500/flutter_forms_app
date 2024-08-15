part of 'register_cubit_cubit.dart';


enum FormStatus {
  invalid,
  valid,
  validating,
}

class RegisterFormCubitState extends Equatable {

  final FormStatus formStatus;

  final String username;
  final String email;
  final String password;

  const RegisterFormCubitState({
    this.formStatus = FormStatus.invalid,
    this.username = '', 
    this.email = '', 
    this.password = '',
  });

  RegisterFormCubitState  copyWith({
    FormStatus? formStatus,
    String? username, 
    String? email, 
    String? password,
  }) => RegisterFormCubitState(
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password,
    formStatus: formStatus ?? this.formStatus,
  );

  @override
  List<Object> get props => [
    username,
    email,
    password,
    formStatus,
  ];
}
