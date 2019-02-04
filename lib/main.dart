import 'package:arch_examples/data/repository.dart';
import 'package:arch_examples/screens/bloc/user_bloc_screen.dart';
import 'package:arch_examples/screens/scoped_model/user_model_screen.dart';
import 'package:arch_examples/screens/vanilla/vanilla_screen.dart';
import 'package:flutter/material.dart';

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
        builder: (context) => UserModelScreen(_repository),
      ),
    );
  }

  void openBloc(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserBlocScreen(_repository),
      ),
    );
  }
}
