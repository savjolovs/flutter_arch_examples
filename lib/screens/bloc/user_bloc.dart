import 'dart:async';

import 'package:arch_examples/data/repository.dart';
import 'package:arch_examples/data/user.dart';
import 'package:arch_examples/screens/bloc/bloc_provider.dart';

class UserBloc extends BlocBase {
  UserBloc(this._repository);

  final Repository _repository;

  final _userStreamController = StreamController<UserState>();

  Stream<UserState> get user => _userStreamController.stream;

  void loadUserData() {
    _userStreamController.sink.add(UserState._userLoading());
    _repository.getUser().then((user) {
      _userStreamController.sink.add(UserState._userData(user));
    });
  }

  @override
  void dispose() {
    _userStreamController.close();
  }
}

class UserState {
  UserState();
  factory UserState._userData(User user) = UserDataState;
  factory UserState._userLoading() = UserLoadingState;
}

class UserInitState extends UserState {}

class UserLoadingState extends UserState {}


class UserDataState extends UserState {
  UserDataState(this.user);
  final User user;
}
