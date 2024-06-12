import 'package:equatable/equatable.dart';


abstract class SettingsState extends Equatable {
  final List? propss;
  SettingsState([ this.propss]);

  @override
  List get props => (propss ?? []);
}

/// UnInitialized
class UnSettingsState extends SettingsState {
  UnSettingsState();

  @override
  String toString() => 'UnSettingState';
}

/// Initialized
class InSettingsState extends SettingsState {
  final String hello;

  InSettingsState(this.hello) : super([hello]);

  @override
  String toString() => 'InSettingState $hello';
}

class ErrorSettingsState extends SettingsState {
  final String errorMessage;

  ErrorSettingsState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorSettingState';
}

// Loading
class LoadingSettingsState extends SettingsState {
  LoadingSettingsState() : super();

  @override
  String toString() => 'LoadingSettingState ';
}


