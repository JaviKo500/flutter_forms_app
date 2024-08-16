import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_cubit_state.dart';

class RegisterCubit extends Cubit<RegisterFormCubitState> {
  RegisterCubit() : super(const RegisterFormCubitState());

  void onSubmit() {
    print('State');
    print(state);
  }

  void usernameChange( String  value ){
    final username = Username.dirty( value: value );
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate( [ username ] ),
      )
    );
  }
  
  void emailChange( String  value ){
    emit(
      state.copyWith(
        email: value,
      )
    );
  }
  
  void passwordChange( String  value ){
    emit(
      state.copyWith(
        password: value,
      )
    );
  }
}
