
import 'package:formz/formz.dart';

enum UsernameError { empty, length }

class Username extends FormzInput<String, UsernameError> {
  const Username.pure() : super.pure('');
  const Username.dirty({String value = ''}) : super.dirty(value);

  @override
  UsernameError? validator(String value) {
    if ( value.isEmpty ) return UsernameError.empty;
    if ( value.trim().length < 6 ) return UsernameError.length;
    return null;
  }
}