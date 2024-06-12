import 'package:equatable/equatable.dart';


abstract class SendRequestState extends Equatable {
  final List? propss;
  SendRequestState([ this.propss]);

  @override
  List get props => (propss ?? []);
}

/// UnInitialized
class UnSendRequestState extends SendRequestState {
  UnSendRequestState();

  @override
  String toString() => 'UnSendRequestState';
}

/// Initialized
class InSendRequestState extends SendRequestState {
  final String hello;

  InSendRequestState(this.hello) : super([hello]);

  @override
  String toString() => 'InSendRequestState $hello';
}

class ErrorSendRequestState extends SendRequestState {
  final String errorMessage;

  ErrorSendRequestState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorSendRequestState';
}

// Loading
class LoadingSendRequestState extends SendRequestState {
  LoadingSendRequestState() : super();

  @override
  String toString() => 'LoadingSendRequestState ';
}


