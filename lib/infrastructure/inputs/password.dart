
import 'package:formz/formz.dart';

enum PasswordError { empty, length }

class Password extends FormzInput<String, PasswordError> {
  const Password.pure() : super.pure('');
  const Password.dirty({String value = ''}) : super.dirty(value);

  String? get errorMessage {
    if ( isValid || isPure ) return null;
    if ( displayError  == PasswordError.empty ) return 'Field is required';
    if ( displayError  == PasswordError.length ) return 'Min 6 characters required';
    return null;
  }

  @override
  PasswordError? validator(String value) {
    if ( value.isEmpty ) return PasswordError.empty;
    if ( value.trim().length < 6 ) return PasswordError.length;
    return null;
  }
}