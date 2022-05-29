class RegisterUser {
  String? _fullName;
  String? _email;
  String? _password;
  String? _confirmPassword;

  set fullName(String? fname) {
    _fullName = fname;
  }

  // ignore: unnecessary_getters_setters
  String? get  fullName => _fullName;

  set email(String? email) {
    _email = email;
  }

  // ignore: unnecessary_getters_setters
  String? get  email => _email;

  set password(String? password) {
    _password = password;
  }

  // ignore: unnecessary_getters_setters
  String? get  password => _password;


  set confirmPassword(String? confirmPassword) {
    _confirmPassword = confirmPassword;
  }

  // ignore: unnecessary_getters_setters
  String? get  confirmPassword => _confirmPassword;
}
