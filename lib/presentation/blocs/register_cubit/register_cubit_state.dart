part of 'register_cubit.dart';


enum FormStatus {
  invalid,
  valid,
  validating,
}

class RegisterFormCubitState extends Equatable {

  final FormStatus formStatus;

  final bool isValid;
  final Username username;
  final String email;
  final String password;

  const RegisterFormCubitState({
    this.formStatus = FormStatus.invalid,
    this.username = const Username.pure(), 
    this.email = '', 
    this.password = '',
    this.isValid = false,
  });

  RegisterFormCubitState  copyWith({
    FormStatus? formStatus,
    Username? username, 
    String? email, 
    String? password,
    bool? isValid,
  }) => RegisterFormCubitState(
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password,
    formStatus: formStatus ?? this.formStatus,
    isValid: isValid ?? this.isValid
  );

  @override
  List<Object> get props => [
    username,
    email,
    password,
    formStatus,
  ];
}
