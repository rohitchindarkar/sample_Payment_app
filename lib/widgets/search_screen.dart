import 'package:flutter/material.dart';

import '../models/dashboard/activity_details_model.dart';
import 'dashboard/your_activity_item_view.dart';

class SearchScreen extends StatefulWidget{
  static const String routeName = '/searchScreen';

  @override
  _SearchScreenState createState() => _SearchScreenState();

}

class _SearchScreenState extends State<SearchScreen> {

  @override
  void initState() {
    super.initState();
  }

  List<ActivityDetailsModel> searchResults = activityListModel;

  void onQueryChanged(String query) {
    setState(() {
      searchResults = activityListModel
          .where((item) => (item.title.toLowerCase().contains(query.toLowerCase()) || item.shortDesc.toLowerCase().contains(query.toLowerCase())))
          .toList();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 26,
                    width: 26,
                    margin:const EdgeInsets.only(left: 16) ,
                    child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_rounded,size: 24,color: Colors.grey.shade500,)),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      alignment: Alignment.centerLeft,
                      margin:const EdgeInsets.only(left: 8,right: 16),
                      child: TextField(
                        cursorColor: Colors.grey,
                          autofocus:true,
                        onChanged: onQueryChanged,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none
                            ),
                            hintText: 'Search Transaction',
                            hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16
                            ),
                            prefixIcon: const Icon(Icons.search,color: Colors.blueAccent,size: 24,)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(child: ListView.builder(
                itemCount: searchResults.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index){
                  return YourActivityItemView(searchResults[index]);
                }))
          ],
        ),
      ),
    );
  }

}