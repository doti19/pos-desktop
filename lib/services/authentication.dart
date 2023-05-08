import 'package:hive/hive.dart';

import '../models/user/user.dart';

class AuthenticationService {
  late Box<User> _users;
  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());

    _users = await Hive.openBox<User>('UsersBox');
  }

  Future<String?> authenticateUser(
      final String username, final String password) async {
    final success = _users.values.any((element) =>
        element.username == username && element.password == password);

    if (success) {
      return username;
    } else {
      return null;
    }
  }
}
