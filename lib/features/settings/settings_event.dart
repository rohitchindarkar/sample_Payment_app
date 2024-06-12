import 'dart:async';
import 'package:payment_application/features/settings/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SettingsEvent {
  Stream<SettingsState> applyAsync(
      {SettingsState currentState, SettingsBloc bloc});
}

class UnSettingsEvent extends SettingsEvent {
  @override
  Stream<SettingsState> applyAsync(
      {SettingsState? currentState, SettingsBloc? bloc}) async* {
    yield UnSettingsState();
  }
}
