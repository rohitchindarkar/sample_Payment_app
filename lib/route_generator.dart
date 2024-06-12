
import 'package:flutter/material.dart';
import 'package:payment_application/features/dashboard/dashboard_page.dart';
import 'package:payment_application/features/login/index.dart';
import 'package:payment_application/features/scan_receipt/index.dart';
import 'package:payment_application/widgets/payment_screen.dart';

import 'features/send_request/send_request_page.dart';
import 'features/settings/settings_page.dart';
import 'widgets/app_bottom_navigation_scaffold/app_bottom_navigation_scaffold_v2.dart';
import 'widgets/search_screen.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {

      case AppBottomNavigationScaffoldV2.routeName:
        return MaterialPageRoute(
            builder: (context) => const AppBottomNavigationScaffoldV2());

      case LoginPage.routeName:
        return MaterialPageRoute(
            builder: (context) => LoginPage());

      case DashboardPage.routeName:
        return MaterialPageRoute(
            builder: (context) => DashboardPage());

      case SettingsPage.routeName:
        return MaterialPageRoute(
            builder: (context) => SettingsPage());

      case ScanReceiptPage.routeName:
        return MaterialPageRoute(
            builder: (context) => ScanReceiptPage());

        case SendRequestPage.routeName:
        return MaterialPageRoute(
            builder: (context) => SendRequestPage());

      case SearchScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => SearchScreen());

      case PaymentScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => PaymentScreen(),
          settings: settings,);

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
