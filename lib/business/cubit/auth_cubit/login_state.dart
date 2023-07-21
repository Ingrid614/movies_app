import '../../../data/models/user.dart';

abstract class LoginState{}

class LoggingIn extends LoginState{}

class LoggedIn extends LoginState{
  final User user;
  LoggedIn(this.user);
}

class InitialLoginState extends LoginState{}

class LoginFailed extends LoginState{
  final String message;
  LoginFailed(this.message);
}
