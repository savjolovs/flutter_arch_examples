import 'package:arch_examples/data/user.dart';
import 'package:arch_examples/screens/bloc/bloc_provider.dart';
import 'package:arch_examples/screens/bloc/user_bloc.dart';
import 'package:flutter/material.dart';

class UserBlocScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc'),
      ),
      body: SafeArea(
        child: StreamBuilder<UserState>(
          stream: userBloc.user,
          initialData: UserInitState(),
          builder: (context, snapshot) {
            if (snapshot.data is UserInitState) {
              return _buildInit(userBloc);
            }
            if (snapshot.data is UserDataState) {
              UserDataState state = snapshot.data;
              return _buildContent(state.user);
            }
            if (snapshot.data is UserLoadingState) {
              return _buildLoading();
            }
          },
        ),
      ),
    );
  }

  Widget _buildInit(UserBloc userBloc) {
    return Center(
      child: RaisedButton(
        child: const Text('Load user data'),
        onPressed: () {
          userBloc.loadUserData();
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
