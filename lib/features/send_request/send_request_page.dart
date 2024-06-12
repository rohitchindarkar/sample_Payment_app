import 'package:flutter/material.dart';
import 'package:payment_application/features/send_request/index.dart';

class SendRequestPage extends StatefulWidget {
  static const String routeName = '/sendRequest';

  @override
  _SendRequestPageState createState() => _SendRequestPageState();
}

class _SendRequestPageState extends State<SendRequestPage> {
  final _sendRequestBloc = SendRequestBloc(UnSendRequestState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SendRequestScreen(sendRequestBloc: _sendRequestBloc),
    );
  }
}
