import 'package:arch_examples/data/repository.dart';
import 'package:arch_examples/data/user.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  UserModel(this._repository);
  final Repository _repository;

  bool _isLoading = false;
  User _user;

  User get user => _user;
  bool get isLoading => _isLoading;

  void loadUserData() {
    _isLoading = true;
    notifyListeners();
    _repository.getUser().then((user) {
      _user = user;
      _isLoading = false;
      notifyListeners();
    });
  }

  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);
}
