import 'package:flutter/material.dart';
import 'package:payment_application/utility/AppUtility.dart';

import '../../models/dashboard/activity_details_model.dart';

class YourActivityItemView extends StatelessWidget{
  ActivityDetailsModel activityDetailsModel;
  YourActivityItemView(this.activityDetailsModel,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
     width: MediaQuery.of(context).size.width,
     margin: const EdgeInsets.symmetric(horizontal: 24),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
              Expanded(child: Text(activityDetailsModel.shortDesc,textAlign: TextAlign.left,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),),
              Text('\$${AppUtility.amountFormat(activityDetailsModel.amount)}',textAlign: TextAlign.center,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),),
            ],
          ),
         const SizedBox(height: 6,),
         Text(activityDetailsModel.title,textAlign: TextAlign.center,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),),
         const SizedBox(height: 6,),
         Text('Return Time Remaining ${AppUtility.getWeekDifference(DateTime.parse(activityDetailsModel.returnDateTime))}',textAlign: TextAlign.center,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Colors.black),),
         const SizedBox(height: 6,),
         Text(activityDetailsModel.title,textAlign: TextAlign.center,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Colors.black),),
         const SizedBox(height: 12,),
         Divider(thickness: 1.5,color: Colors.grey.shade300,)
       ],
     ),
   );
  }

}