import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:payment_application/features/dashboard/index.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(DashboardState initialState) : super(initialState);

  @override
  Stream<DashboardState> mapEventToState(
      DashboardEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'DashboardBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
