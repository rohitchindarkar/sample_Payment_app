import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:payment_application/features/scan_receipt/index.dart';

class ScanReceiptBloc extends Bloc<ScanReceiptEvent, ScanReceiptState> {
  ScanReceiptBloc(ScanReceiptState initialState) : super(initialState);

  @override
  Stream<ScanReceiptState> mapEventToState(
      ScanReceiptEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'ScanReceiptBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}


