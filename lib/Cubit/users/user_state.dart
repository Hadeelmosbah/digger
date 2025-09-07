class UserState {}

class UserInitial extends UserState {}


class SignInLoading extends UserState {}
class SignInSuccess extends UserState {}
class SignInFailure extends UserState {
  final String errMessage;
  SignInFailure({required this.errMessage});
}

class SignUpLoading extends UserState {}
class SignUpSuccess extends UserState {}
class SignUpFailure extends UserState {
  final String errMessage;
  SignUpFailure({required this.errMessage});
}


class LogoutLoading extends UserState {}
class LogoutSuccess extends UserState {}
class LogoutFailure extends UserState {
  final String errMessage;
  LogoutFailure({required this.errMessage});
}
