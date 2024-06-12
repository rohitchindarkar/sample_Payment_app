import 'dart:async';
import 'package:payment_application/features/scan_receipt/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ScanReceiptEvent {
  Stream<ScanReceiptState> applyAsync(
      {ScanReceiptState currentState, ScanReceiptBloc bloc});
}

class UnScanReceiptEvent extends ScanReceiptEvent {
  @override
  Stream<ScanReceiptState> applyAsync(
      {ScanReceiptState? currentState, ScanReceiptBloc? bloc}) async* {
    yield UnScanReceiptState();
  }
}
