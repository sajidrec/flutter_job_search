class Constants {
  static RegExp emailValidatorRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  static String userCredentialKey = "userCred";
  static String userLoggedInKey = "userLoggedInKey";
}