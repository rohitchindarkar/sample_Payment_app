import 'dart:async';
import 'package:payment_application/features/send_request/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SendRequestEvent {
  Stream<SendRequestState> applyAsync(
      {SendRequestState currentState, SendRequestBloc bloc});
}

class UnSendRequestEvent extends SendRequestEvent {
  @override
  Stream<SendRequestState> applyAsync(
      {SendRequestState? currentState, SendRequestBloc? bloc}) async* {
    yield UnSendRequestState();
  }
}
