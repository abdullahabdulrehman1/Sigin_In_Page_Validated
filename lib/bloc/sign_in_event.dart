abstract class SignInEvent {}

// class SignInInitialEvent extends SignInEvent {}

class SignInTextChangeEvent extends SignInEvent {
  final String emailvalue;
  final String passwordvalue;

  SignInTextChangeEvent(this.emailvalue, this.passwordvalue);
}

class SignInSubmitEvent extends SignInEvent {
  final String email;
  final String password;

  SignInSubmitEvent(this.email, this.password);
}

// class SignInNoErrorEvent extends SignInEvent {}
