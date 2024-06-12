import 'package:flutter/material.dart';
import 'package:payment_application/features/settings/index.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = '/settings';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingsPage> {
  final _settingBloc = SettingsBloc(UnSettingsState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SettingsScreen(settingsBloc: _settingBloc),
    );
  }
}
