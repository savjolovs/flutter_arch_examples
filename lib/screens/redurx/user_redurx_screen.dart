import 'package:arch_examples/data/user.dart';
import 'package:arch_examples/screens/redurx/actions.dart';
import 'package:arch_examples/screens/redurx/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redurx/flutter_redurx.dart';

class _Props {
  _Props({
    @required this.user,
    this.isLoading = false,
  });

  final User user;
  final bool isLoading;
}

class UserReduRxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReduRx'),
      ),
      body: SafeArea(
        child: Connect<AppState, _Props>(
          convert: (state) =>
              _Props(user: state.user, isLoading: state.isLoading),
          where: (prev, next) => next != prev,
          nullable: true,
          builder: (props) {
            if (props.isLoading) {
              return _buildLoading();
            }

            if (props.user == null) {
              return _buildInit(context);
            }

            return _buildContent(props.user);
          },
        ),
      ),
    );
  }

  Widget _buildInit(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: const Text('Load user data'),
        onPressed: () {
          Provider.dispatch<AppState>(context, LoadingUserData()).dispatch(LoadUserData());
        },
      ),
    );
  }

  Widget _buildContent(User user) {
    return Center(
      child: Text('Hello ${user.name} ${user.surname}'),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
