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
  final Email email;
  final Password password;

  const RegisterFormCubitState({
    this.formStatus = FormStatus.invalid,
    this.username = const Username.pure(), 
    this.email = const Email.pure(), 
    this.password = const Password.pure(),
    this.isValid = false,
  });

  RegisterFormCubitState  copyWith({
    FormStatus? formStatus,
    Username? username, 
    Email? email, 
    Password? password,
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
    isValid,
    username,
    email,
    password,
    formStatus,
  ];
}
