import 'package:flutter/material.dart';
import 'package:payment_application/features/scan_receipt/index.dart';

class ScanReceiptPage extends StatefulWidget {
  static const String routeName = '/scanReceiptPage';

  @override
  _ScanReceiptPageState createState() => _ScanReceiptPageState();
}

class _ScanReceiptPageState extends State<ScanReceiptPage> {
  final _scanReceiptBloc = ScanReceiptBloc(UnScanReceiptState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScanReceiptScreen(scanReceiptBloc: _scanReceiptBloc),
    );
  }
}
