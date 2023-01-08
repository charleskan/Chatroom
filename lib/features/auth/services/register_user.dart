

import 'package:pma001/features/auth/services/interface/userRepository.dart';

class RegisterUser {
  final UserRepository _userRepository;

  RegisterUser(this._userRepository);

  register({required String username, required String password}) =>
      _userRepository.register(username: username, password: password);
}
