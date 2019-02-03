import 'package:arch_examples/data/repository.dart';
import 'package:arch_examples/screens/bloc/bloc_provider.dart';
import 'package:arch_examples/screens/bloc/user_bloc.dart';
import 'package:arch_examples/screens/bloc/user_bloc_screen.dart';
import 'package:arch_examples/screens/redurx/app_state.dart';
import 'package:arch_examples/screens/redurx/middlewares.dart';
import 'package:arch_examples/screens/redurx/user_redurx_screen.dart';
import 'package:arch_examples/screens/scoped_model/user_model.dart';
import 'package:arch_examples/screens/scoped_model/user_model_screen.dart';
import 'package:arch_examples/screens/vanilla/vanilla_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redurx/flutter_redurx.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Architecture demo',
      home: HomePage(Repository()),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage(this._repository);

  final Repository _repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose demo'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.00),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                child: const Text(
                  'Vanilla',
                ),
                onPressed: () {
                  openVanilla(context);
                },
              ),
              RaisedButton(
                child: const Text(
                  'Scoped model',
                ),
                onPressed: () {
                  openScopedModel(context);
                },
              ),
              RaisedButton(
                child: const Text(
                  'BLOC',
                ),
                onPressed: () {
                  openBloc(context);
                },
              ),
              RaisedButton(
                child: const Text(
                  'ReduRx',
                ),
                onPressed: () {
                  openReduRx(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openVanilla(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VanillaScreen(_repository),
      ),
    );
  }

  void openScopedModel(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScopedModel<UserModel>(
              model: UserModel(_repository),
              child: UserModelScreen(),
            ),
      ),
    );
  }

  void openBloc(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
              bloc: UserBloc(_repository),
              child: UserBlocScreen(),
            ),
      ),
    );
  }

  void openReduRx(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Provider(
              store: Store<AppState>(AppState(user: null))..add(Injector(repository: _repository)),
              child: UserReduRxScreen(),
            ),
      ),
    );
  }
}
