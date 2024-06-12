import 'package:flutter/material.dart';
import 'package:payment_application/widgets/payment_screen.dart';

import '../../models/dashboard/activity_details_model.dart';

class SendAgainItemView extends StatelessWidget{
  ActivityDetailsModel sendAgainActivityList ;
  SendAgainItemView(this.sendAgainActivityList,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
     onTap: (){
       Navigator.pushNamed(context, PaymentScreen.routeName,arguments: {'senderImage':sendAgainActivityList.senderImage,'senderName':sendAgainActivityList.senderName});
     },
     child: Container(
       width: 75,
       margin: const EdgeInsets.only(right: 8),
       child: Column(
         children: [
            CircleAvatar(
             minRadius: 28,
             child: Image.asset("assets/images/${sendAgainActivityList.senderImage}",width: 40.0, height: 40.0,),
           ),
           const SizedBox(height: 6,),
           Text(sendAgainActivityList.senderName.replaceFirst(" ", '\n'),textAlign: TextAlign.center,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black),),
         ],
       ),
     ),
   );
  }

}