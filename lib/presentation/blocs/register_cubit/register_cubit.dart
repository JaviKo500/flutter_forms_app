import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs/email.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_cubit_state.dart';

class RegisterCubit extends Cubit<RegisterFormCubitState> {
  RegisterCubit() : super(const RegisterFormCubitState());

  void onSubmit() {
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        username: Username.dirty( value: state.username.value ),
        password: Password.dirty( value: state.password.value ),
        email: Email.dirty( value: state.email.value ),

        isValid: Formz.validate([
          state.username,
          state.password,
          state.email
        ]),
      )
    );
  }

  void usernameChange( String  value ){
    final username = Username.dirty( value: value );
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate( [ username, state.password, state.username ] ),
      )
    );
  }
  
  void emailChange( String  value ){
    final email = Email.dirty( value: value );
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([ email, state.password, state.username ])
      )
    );
  }
  
  void passwordChange( String  value ){
    final password = Password.dirty( value: value );
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate( [ password, state.username, state.email ] ),
      )
    );
  }
}
