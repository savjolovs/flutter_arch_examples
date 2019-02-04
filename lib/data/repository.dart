import 'dart:async';
import 'package:arch_examples/data/user.dart';

class Repository {
  Future<User> getUser() async {
    await Future.delayed(Duration(seconds: 2));
    return User(name: 'John', surname: 'Smith');
  }
}
