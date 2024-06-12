import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:payment_application/features/settings/index.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(SettingsState initialState) : super(initialState);

  @override
  Stream<SettingsState> mapEventToState(
      SettingsEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'SettingsBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
