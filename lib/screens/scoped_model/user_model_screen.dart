import 'package:arch_examples/screens/scoped_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vanilla'),
      ),
      body: SafeArea(
        child:
            ScopedModelDescendant<UserModel>(builder: (context, child, model) {
          if (model.isLoading) {
            return _buildLoading();
          } else {
            if (model.user != null) {
              return _buildContent(model);
            } else {
              return _buildInit(model);
            }
          }
        }),
      ),
    );
  }

  Widget _buildInit(UserModel userModel) {
    return Center(
      child: RaisedButton(
        child: const Text('Load user data'),
        onPressed: () {
          userModel.loadUserData();
        },
      ),
    );
  }

  Widget _buildContent(UserModel userModel) {
    return Center(
      child: Text('Hello ${userModel.user.name} ${userModel.user.surname}'),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
