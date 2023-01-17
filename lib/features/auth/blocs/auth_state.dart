class User {
  final String id;
  final String? email;
  final String name;
  final String? photoUrl;

  User({
    required this.id,
    this.email,
    required this.name,
    this.photoUrl,
  });
}

class AuthState {
  final bool isRetrievingLoginState;
  final User? user;

  AuthState({
    required this.isRetrievingLoginState,
    this.user,
  });
  const AuthState.initial()
      : isRetrievingLoginState = false,
        user = null;
}
