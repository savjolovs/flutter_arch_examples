import 'package:arch_examples/data/repository.dart';
import 'package:arch_examples/screens/redurx/app_state.dart';
import 'package:flutter_redurx/flutter_redurx.dart';

class LoadUserData extends AsyncAction<AppState> {
  Repository _repository;

  @override
  Future<Computation<AppState>> reduce(AppState state) async {
    assert(_repository != null);

    final user = await _repository.getUser();    

    return (AppState state) => AppState(user: user, isLoading: false);
  }

  set repository(Repository repository) => _repository = repository;
}

class LoadingUserData extends Action<AppState> {
  @override
  AppState reduce(AppState state) => AppState(user: null, isLoading: true);
}