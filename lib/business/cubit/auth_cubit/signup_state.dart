import '../../../data/models/user.dart';

abstract class SignUpState{}
class SigningUp extends  SignUpState{}

class SignUpSuccess extends SignUpState{
  final User user;
  SignUpSuccess(this.user);
}

class SignUpFailed extends SignUpState{
  final String message;
  SignUpFailed(this.message);
}

class InitialSignUpState extends SignUpState{}
