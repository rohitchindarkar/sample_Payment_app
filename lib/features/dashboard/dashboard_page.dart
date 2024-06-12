import 'package:flutter/material.dart';
import 'package:payment_application/features/dashboard/index.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _dashboardBloc = DashboardBloc(UnDashboardState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DashboardScreen(dashboardBloc: _dashboardBloc),
    );
  }
}
