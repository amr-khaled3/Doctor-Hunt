sealed class AuthState {}

class InitState extends AuthState{}


class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterFailureState extends AuthState{}

class ChangeVisibilityState extends AuthState{}

class ChangeAgreeState extends AuthState{}

class LoginFailureState extends AuthState{}

class LoginSuccessState extends AuthState{}