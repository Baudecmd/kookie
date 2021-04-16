/// Check if a String is a valid email.
/// Return null if it is valid.
String? isEmail(String val) {
  // Null or empty string is invalid
  if (val.isEmpty) {
    return 'Veuillez saisir votre email';
  }

  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(val)) {
    return 'Email non valide';
  }

  return null;
}

/// Check if a String is a valid password.
/// Return null if it is valid.
/// Minimum 1 Upper case
/// Minimum 1 lowercase
/// Minimum 1 Numeric Number
/// Minimum 1 Special Character
/// Common Allow Character ( ! @ # $ & * ~ )
String? isGoodPwd(String val) {
  // Null or empty string is invalid
  if (val == null || val.isEmpty) {
    return 'Veuillez saisir votre mot de passe';
  }

  const pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(val)) {
    return 'Utilisez un mot de passe fort';
  }
  return null;
}
