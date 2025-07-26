abstract class LoginWithGoogleState {}

class LoginWithGoogleInitial extends LoginWithGoogleState {}
class LoginWithGoogleLoading extends LoginWithGoogleState {}
class LoginWithGoogleSuccess extends LoginWithGoogleState {
  final String userName;

  LoginWithGoogleSuccess(this.userName);
}
class LoginWithGoogleFailure extends LoginWithGoogleState {
  final String error;

  LoginWithGoogleFailure(this.error);
} 