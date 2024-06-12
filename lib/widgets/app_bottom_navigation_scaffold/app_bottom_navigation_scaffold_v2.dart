import 'dart:io';

import 'package:flutter/material.dart';
import '../../features/dashboard/dashboard_page.dart';
import '../../features/scan_receipt/scan_receipt_page.dart';
import '../../features/send_request/send_request_page.dart';
import '../../features/settings/settings_page.dart';
import '../../utility/AppConstant.dart';
import 'appBottomNavigationBarV2.dart';


class AppBottomNavigationScaffoldV2 extends StatefulWidget {
  static const String routeName = '/AppBottomNavigationScaffoldV2';

  const AppBottomNavigationScaffoldV2({Key? key}) : super(key: key);
  @override
  _AppBottomNavigationScaffoldV2State createState() =>
      _AppBottomNavigationScaffoldV2State();
}

class _AppBottomNavigationScaffoldV2State
    extends State<AppBottomNavigationScaffoldV2>
    with SingleTickerProviderStateMixin {
  Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
    DashboardPage.routeName: GlobalKey<NavigatorState>(),
    ScanReceiptPage.routeName: GlobalKey<NavigatorState>(),
    SendRequestPage.routeName: GlobalKey<NavigatorState>(),
    SettingsPage.routeName: GlobalKey<NavigatorState>()
  };
  late TabController tabController;
  final _tabBarKey = GlobalKey(debugLabel: 'appTabBar');
  int currentScreenIndex = AppConstant.footerSelectedIndex;
  late DateTime currentBackPressTime;
  int tabindex = 0;
  String assetsTabIndex = "";
  Future<void> _selectIndex(int index) async {

    if (mounted && FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
    if (index != currentScreenIndex) {
      tabController.animateTo(index, curve: Curves.slowMiddle);
      setState(() {
        currentScreenIndex = index;
        AppConstant.footerSelectedIndex = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      vsync: this,
      length: navigatorKeys.length,
      initialIndex: AppConstant.footerSelectedIndex,
    );

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {

        if (Platform.isAndroid) {
          // MoveToBackground.moveTaskToBack();
        }
        return Future(() => false);
      },
      child: Scaffold(
          backgroundColor: Colors.white, //Theme.of(context).backgroundColor,
          body: SafeArea(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    key: _tabBarKey,
                    controller: tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      DashboardPage(),
                      ScanReceiptPage(),
                      SendRequestPage(),
                      SettingsPage(),
                    ],
                  ))),
          bottomNavigationBar: AppBottomNavigationBarV2(
            onItemClick: _selectIndex,
          )),
    );
  }


}


