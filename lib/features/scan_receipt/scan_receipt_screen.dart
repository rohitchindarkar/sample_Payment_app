
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payment_application/features/scan_receipt/index.dart';


class ScanReceiptScreen extends StatefulWidget {
  const ScanReceiptScreen({
    Key? key,
    required ScanReceiptBloc scanReceiptBloc,
  })  : _scanReceiptBloc = scanReceiptBloc,
        super(key: key);

  final ScanReceiptBloc _scanReceiptBloc;

  @override
  ScanReceiptScreenState createState() {
    return ScanReceiptScreenState();
  }
}

class ScanReceiptScreenState extends State<ScanReceiptScreen> {
  ScanReceiptScreenState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanReceiptBloc, ScanReceiptState>(
        bloc: widget._scanReceiptBloc,
        listener: (
          BuildContext context,
            ScanReceiptState currentState,
        ) {
          if (currentState is LoadingScanReceiptState) {

          }
          if (currentState is ErrorScanReceiptState) {

          }
        },
        builder: (
          BuildContext context,
            ScanReceiptState currentState,
        ) {
          return WillPopScope(
            onWillPop: () {
              Navigator.pop(context, true);
              return Future(() => false);
            },
            child: const Center(
              child: Text(
                'Coming Soon',style: const TextStyle(color: Colors.black,fontSize: 24),
              ),
            ),
          );
        });
  }
}
