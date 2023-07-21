import '../../../data/models/user.dart';

abstract class UpdateState{}

class Updating extends UpdateState{}

class Updated extends UpdateState{
  final User user;
  Updated(this.user);
}

class InitialUpdateState extends UpdateState{}

class UpdateFailed extends UpdateState{
  final String message;
  UpdateFailed(this.message);
}
