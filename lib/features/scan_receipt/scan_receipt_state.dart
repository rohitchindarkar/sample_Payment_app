import 'package:equatable/equatable.dart';


abstract class ScanReceiptState extends Equatable {
  final List? propss;
  ScanReceiptState([ this.propss]);

  @override
  List get props => (propss ?? []);
}

/// UnInitialized
class UnScanReceiptState extends ScanReceiptState {
  UnScanReceiptState();

  @override
  String toString() => 'UnScanReceiptState';
}

/// Initialized
class InScanReceiptState extends ScanReceiptState {
  final String hello;

  InScanReceiptState(this.hello) : super([hello]);

  @override
  String toString() => 'InScanReceiptState $hello';
}

class ErrorScanReceiptState extends ScanReceiptState {
  final String errorMessage;

  ErrorScanReceiptState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorScanReceiptState';
}

// Loading
class LoadingScanReceiptState extends ScanReceiptState {
  LoadingScanReceiptState() : super();

  @override
  String toString() => 'LoadingScanReceiptState ';
}


