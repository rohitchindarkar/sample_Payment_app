import 'package:flutter/material.dart';

import '../../utility/AppConstant.dart';


class AppBottomNavigationBarV2 extends StatefulWidget {
  final void Function(int) onItemClick;

  AppBottomNavigationBarV2({Key? key, required this.onItemClick})
      : super(key: key);

  @override
  _AppBottomNavigationBarV2State createState() =>
      _AppBottomNavigationBarV2State();
}

class _AppBottomNavigationBarV2State extends State<AppBottomNavigationBarV2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1.5,
            color: Colors.grey.shade200,
          ),
          BottomNavigationBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.black38,
            selectedLabelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 12.0,
                fontWeight: FontWeight.w600),
            unselectedLabelStyle: const TextStyle(
              color: Colors.black38,
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
            currentIndex: AppConstant.footerSelectedIndex, // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                    padding: const EdgeInsets.only(left: 4,right: 4,bottom: 4),
                    child: Icon(Icons.dashboard_rounded,size: 24,color: AppConstant.footerSelectedIndex == 0 ? Colors.blueAccent : Colors.black38,)
                ),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon:  Padding(
                    padding: const EdgeInsets.only(left: 4,right: 4,bottom: 4),
                    child: Icon(Icons.qr_code_scanner_rounded,size: 24,color: AppConstant.footerSelectedIndex == 1 ? Colors.blueAccent : Colors.black38,)
                ),
                label: 'Scan Receipt',
              ),
              BottomNavigationBarItem(
                icon:  Padding(
                    padding: const EdgeInsets.only(left: 4,right: 4,bottom: 4),
                    child: Icon(Icons.call_to_action,size: 24,color: AppConstant.footerSelectedIndex == 2 ? Colors.blueAccent : Colors.black38,)
                ),
                label: 'Send & Request',
              ),
              BottomNavigationBarItem(
                icon:  Padding(
                    padding: const EdgeInsets.only(left: 4,right: 4,bottom: 4),
                    child: Icon(Icons.account_circle_rounded,size: 24,color: AppConstant.footerSelectedIndex == 3 ? Colors.blueAccent : Colors.black38,)
                ),
                label: 'Settings',
              ),
            ],
            onTap: widget.onItemClick,
          ),
        ],
      ),
    );
  }
}
