import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_cubit_state.dart';

class RegisterCubitCubit extends Cubit<RegisterFormCubitState> {
  RegisterCubitCubit() : super(const RegisterFormCubitState());

  void onSubmit() {
    print('State');
    print(state);
  }

  void usernameChange( String  value ){
    emit(
      state.copyWith(
        username: value,
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
