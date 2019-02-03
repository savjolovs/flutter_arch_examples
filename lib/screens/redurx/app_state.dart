import 'package:arch_examples/data/user.dart';
import 'package:meta/meta.dart';

class AppState {
  AppState({
    @required this.user,
    this.isLoading = false,
  });

  final User user;
  final bool isLoading;
}