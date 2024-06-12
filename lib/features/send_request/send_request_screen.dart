
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payment_application/features/send_request/index.dart';

class SendRequestScreen extends StatefulWidget {
  const SendRequestScreen({
    Key? key,
    required SendRequestBloc sendRequestBloc,
  })  : _sendRequestBloc = sendRequestBloc,
        super(key: key);

  final SendRequestBloc _sendRequestBloc;

  @override
  SendRequestScreenState createState() {
    return SendRequestScreenState();
  }
}

class SendRequestScreenState extends State<SendRequestScreen> {
  SendRequestScreenState();

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
    return BlocConsumer<SendRequestBloc, SendRequestState>(
        bloc: widget._sendRequestBloc,
        listener: (
          BuildContext context,
            SendRequestState currentState,
        ) {
          if (currentState is LoadingSendRequestState) {

          }
          if (currentState is ErrorSendRequestState) {

          }
        },
        builder: (
          BuildContext context,
            SendRequestState currentState,
        ) {
          return WillPopScope(
            onWillPop: () {
              Navigator.pop(context, true);
              return Future(() => false);
            },
            child: const Center(
              child: Text(
                'Coming Soon',style: TextStyle(color: Colors.black,fontSize: 24),
              ),
            ),
          );
        });
  }
}
