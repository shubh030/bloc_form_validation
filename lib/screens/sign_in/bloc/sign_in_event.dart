abstract class SignInEvent {}

class SignTextChanged extends SignInEvent {
  final String emailValue;
  final String passValue;

  SignTextChanged(
    this.emailValue,
    this.passValue,
  );
}

class SignInSubmit extends SignInEvent {
  final String email;
  final String pass;

  SignInSubmit(
    this.email,
    this.pass,
  );
}
