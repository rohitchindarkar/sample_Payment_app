import 'package:flutter/material.dart';

import '../../models/settings/settings_model.dart';

class SettingItemView extends StatelessWidget{

  int index;
  List<SettingModel> searchResult;
  SettingItemView(this.searchResult,this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
     width: 75,
     margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
     child: Column(
       children: [
         Row(
           children: [
             Icon(searchResult[index].icons,size: 24,color: Colors.grey.shade300),
             const SizedBox(width: 12,),
             Text(searchResult[index].title,textAlign: TextAlign.center,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
             const Expanded(child: SizedBox()),
             const Icon(Icons.arrow_forward_ios_rounded,size: 24,color: Colors.blueAccent,)

           ],
         ),
         const SizedBox(height: 8,),
         Divider(thickness: 1.5,color: Colors.grey.shade300,)
       ],
     ),
   );
  }

}