import 'package:equatable/equatable.dart';

import '../../models/user_details/user_details_model.dart';


abstract class DashboardState extends Equatable {
  final List? propss;
  DashboardState([ this.propss]);

  @override
  List get props => (propss ?? []);
}

/// UnInitialized
class UnDashboardState extends DashboardState {
  UnDashboardState();

  @override
  String toString() => 'UnDashboardState';
}

/// Initialized
class InDashboardState extends DashboardState {
  final String hello;

  InDashboardState(this.hello) : super([hello]);

  @override
  String toString() => 'InDashboardState $hello';
}

class ErrorDashboardState extends DashboardState {
  final String errorMessage;

  ErrorDashboardState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorDashboardState';
}

// Loading
class LoadingDashboardState extends DashboardState {
  String fromEvent;
  LoadingDashboardState(this.fromEvent) : super();

  @override
  String toString() => 'LoadingDashboardState ';
}

// get User Details
class GetUserDetailsState extends DashboardState {
  GetUserDetailsState() : super();

  @override
  String toString() => 'GetUserDetailsState ';
}

// get Activity Data
class GetActivityDetailsState extends DashboardState {
  GetActivityDetailsState() : super();

  @override
  String toString() => 'GetActivityDetailsState ';
}


