
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payment_application/features/login/index.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
    required LoginBloc loginBloc,
  })  : _loginBloc = loginBloc,
        super(key: key);

  final LoginBloc _loginBloc;

  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  LoginScreenState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
        bloc: widget._loginBloc,
        listener: (
          BuildContext context,
            LoginState currentState,
        ) {
          if (currentState is LoadingLoginState) {

          }
          if (currentState is ErrorLoginState) {

          }
        },
        builder: (
          BuildContext context,
            LoginState currentState,
        ) {
          return WillPopScope(
            onWillPop: () {
              Navigator.pop(context, true);
              return Future(() => false);
            },
            child: SingleChildScrollView(
              child: Column(
                children: [

                ],
              ),
            )
            ,
          );
        });
  }
}
