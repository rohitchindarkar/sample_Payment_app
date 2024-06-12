import 'dart:async';
import 'dart:convert';
import 'package:payment_application/features/dashboard/index.dart';
import 'package:meta/meta.dart';
import 'package:payment_application/models/dashboard/activity_details_model.dart';
import 'package:payment_application/utility/AppConstant.dart';
import 'package:payment_application/utility/local_db/local_database.dart';

import '../../models/user_details/user_details_model.dart';

@immutable
abstract class DashboardEvent {
  Stream<DashboardState> applyAsync(
      {DashboardState currentState, DashboardBloc bloc});
}

class UnDashboardEvent extends DashboardEvent {
  @override
  Stream<DashboardState> applyAsync(
      {DashboardState? currentState, DashboardBloc? bloc}) async* {
    yield UnDashboardState();
  }


}

class GetUserDataEvent extends DashboardEvent {
  @override
  Stream<DashboardState> applyAsync(
      {DashboardState? currentState, DashboardBloc? bloc}) async* {

    yield LoadingDashboardState('userDetails');
    await LocalDatabase.openLocalDatabase();
    var getUserData = await LocalDatabase.retrieveUserData();
    if(getUserData.isEmpty) {
      await LocalDatabase.createUserTable();
      await LocalDatabase.insertUserData();
      getUserData = await LocalDatabase.retrieveUserData();
    }
    var userData = json.encode(getUserData[0]);
    UserDetailsModel userDetailsModel = userDetailsModelFromJson(userData);
    setTraditionalLoginDataModel(userDetailsModel);
    yield GetUserDetailsState();
  }
}

class GetActivityDataEvent extends DashboardEvent {
  @override
  Stream<DashboardState> applyAsync(
      {DashboardState? currentState, DashboardBloc? bloc}) async* {

    yield LoadingDashboardState('getActivity');

    await LocalDatabase.openLocalDatabase();
    var getActivityData = await LocalDatabase.retrieveActivityData();
    if(getActivityData.isEmpty) {
      await LocalDatabase.createActivityTable();
      await insertActivityData();
      getActivityData = await LocalDatabase.retrieveActivityData();
    }
    var activityData = json.encode(getActivityData);
    List<ActivityDetailsModel> activityDetailsModel = activityDetailsModelFromJson(activityData);
    setActivityListDataModel(activityDetailsModel);
    yield GetActivityDetailsState();
  }

  Future insertActivityData()async{

    for(int i =0; i < AppConstant.activityListData.length;i++) {
      await LocalDatabase.insertActivityData(AppConstant.activityListData[i]);
    }

  }
}


