import 'package:product_app/model/user.dart';

class UserVm {
  List<User> users = [];

  addUser(User user) {
    users.add(user);
    return user;
  }
}
