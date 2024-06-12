import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserImageShimmer extends StatelessWidget{
  const UserImageShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return  Shimmer.fromColors(
       baseColor: Colors.grey.shade300,
       highlightColor: Colors.grey.shade100,
       enabled: true,
       child: Card(
         elevation: 0,
         color: Colors.white,
         shape:  RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(40.0),
   ),
         child: Container(
           width: 45,
           height: 45,
           decoration: const BoxDecoration(
             shape: BoxShape.circle,
           ),
           child: Container(
             width: 40,
             alignment: Alignment.center,
           ),
         ),
       ),);
  }

}