import 'package:arch_examples/data/repository.dart';
import 'package:arch_examples/data/user.dart';
import 'package:flutter/material.dart';

class VanillaScreen extends StatefulWidget {
  VanillaScreen(this._repository);
  final Repository _repository;

  @override
  State<StatefulWidget> createState() => _VanillaScreenState();
}

class _VanillaScreenState extends State<VanillaScreen> {
  bool _isLoading = false;
  User _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vanilla'),
      ),
      body: SafeArea(
        child: _isLoading ? _buildLoading() : _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_user != null) {
      return _buildContent();
    } else {
      return _buildInit();
    }
  }

  Widget _buildInit() {
    return Center(
      child: RaisedButton(
        child: const Text('Load user data'),
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          widget._repository.getUser().then((user) {
            setState(() {
              _user = user;
              _isLoading = false;
            });
          });
        },
      ),
    );
  }

  Widget _buildContent() {
    return Center(
      child: Text('Hello ${_user.name} ${_user.surname}'),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
