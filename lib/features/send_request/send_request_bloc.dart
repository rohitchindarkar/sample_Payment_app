import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:payment_application/features/send_request/index.dart';

class SendRequestBloc extends Bloc<SendRequestEvent, SendRequestState> {
  SendRequestBloc(SendRequestState initialState) : super(initialState);

  @override
  Stream<SendRequestState> mapEventToState(
      SendRequestEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'SendRequestBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}


