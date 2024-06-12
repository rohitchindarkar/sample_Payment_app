import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserNameShimmer extends StatelessWidget{
  final double height;
  final double width;
  const UserNameShimmer(this.height,this.width,{Key? key}) : super(key: key);

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
         child: Container(
           width: width,
           height: height,
           decoration: const BoxDecoration(
             shape: BoxShape.circle,
           ),
           child: Container(
             width: 35,
             alignment: Alignment.center,
           ),
         ),
       ),);
  }

}