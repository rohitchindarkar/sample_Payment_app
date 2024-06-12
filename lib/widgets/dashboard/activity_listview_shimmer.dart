import 'package:flutter/material.dart';
import 'package:payment_application/widgets/dashboard/user_name_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class ActivityListViewShimmer extends StatelessWidget{

  const ActivityListViewShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return  Shimmer.fromColors(
       baseColor: Colors.grey.shade300,
       highlightColor: Colors.grey.shade100,
       enabled: true,
       child: Container(
         alignment: Alignment.topLeft,
         height: 500,
         margin: const EdgeInsets.symmetric(horizontal: 24),
         child: ListView.builder(
             itemCount: 4,
             shrinkWrap: true,
             physics: const NeverScrollableScrollPhysics(),
             itemBuilder: (BuildContext context,int index){
               return Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 mainAxisSize: MainAxisSize.max,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       const UserNameShimmer(12,200),
                       const UserNameShimmer(16,80),
                     ],
                   ),
                   const UserNameShimmer(14,80),
                   const UserNameShimmer(12,180),
                   const UserNameShimmer(12,190),
                   const SizedBox(height: 6,),
                   Divider(color: Colors.grey.shade300,thickness: 1,),
                   const SizedBox(height: 6,),
                 ],
               );
             }),
       ));
  }

}