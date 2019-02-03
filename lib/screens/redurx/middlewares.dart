import 'package:arch_examples/data/repository.dart';
import 'package:arch_examples/screens/redurx/actions.dart';
import 'package:arch_examples/screens/redurx/app_state.dart';
import 'package:flutter_redurx/flutter_redurx.dart';
import 'package:meta/meta.dart';

class Injector extends Middleware<AppState> {
  Injector({
    @required this.repository,
  });

  final Repository repository;

  @override
  AppState beforeAction(ActionType action, AppState state) {    
    if (action is LoadUserData) {
      action.repository = repository;
    }

    return state;
  }
}