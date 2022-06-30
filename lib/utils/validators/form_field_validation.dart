class FormFieldValidators {
  static String? validateEmail(String? value) {
    var emptyEmailError = 'Email address is empty';
    var invalidEmailError = 'Invalid email address. Please try again';

    if (value!.isEmpty) {
      return emptyEmailError;
    } else {
      final emailValidate = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);

      if (!emailValidate) {
        return invalidEmailError;
      } else {
        return null;
      }
    }
  }

  static String? validatePassword(String? value) {
    var emptyPasswordError = 'Password cannot be empty!';
    var shortPasswordError = 'Password is too short';
    var longPasswordError = 'Password is too long';

    if (value!.isEmpty) {
      return emptyPasswordError;
    } else if (value.length < 4) {
      return shortPasswordError;
    } else if (value.length > 16) {
      return longPasswordError;
    }
    return null;
  }

  static String? validateUsername(String? value) {
    var emptyUsernameError = 'Username is empty';
    var invalidUsernameError = 'Invalid username';
    var longUsernameError = 'Username is too long';
    var shortUsernameError = 'Username is too short';

    if (value!.isEmpty) {
      return emptyUsernameError;
    } else if (value.length < 3) {
      return shortUsernameError;
    } else if (value.length > 30) {
      return longUsernameError;
    } else {
      final usernameValidate = RegExp(r'^(?=[a-zA-Z0-9._]{3,30}$)(?!.*[_.]{2})[^_.].*[^_.]$').hasMatch(value);

      if (!usernameValidate) {
        return invalidUsernameError;
      } else {
        return null;
      }
    }
  }
}
