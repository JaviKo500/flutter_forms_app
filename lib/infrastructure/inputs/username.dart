
import 'package:formz/formz.dart';

enum UsernameError { empty, length }

class Username extends FormzInput<String, UsernameError> {
  const Username.pure() : super.pure('');
  const Username.dirty({String value = ''}) : super.dirty(value);
  
  String? get errorMessage {
    if ( isValid || isPure ) return null;
    if ( displayError  == UsernameError.empty ) return 'Field is required';
    if ( displayError  == UsernameError.length ) return 'Min 6 characters required';
    return null;
  }
  
  @override
  UsernameError? validator(String value) {
    if ( value.isEmpty ) return UsernameError.empty;
    if ( value.trim().length < 6 ) return UsernameError.length;
    return null;
  }
}