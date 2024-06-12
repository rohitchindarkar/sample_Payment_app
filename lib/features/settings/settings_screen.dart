import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payment_application/features/settings/index.dart';
import 'package:payment_application/models/user_details/user_details_model.dart';
import 'package:payment_application/utility/AppConstant.dart';
import '../../models/settings/settings_model.dart';
import '../../utility/HexColor.dart';
import '../../widgets/settings/setting_item_view.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    Key? key,
    required SettingsBloc settingsBloc,
  })  : _settingsBloc = settingsBloc,
        super(key: key);

  final SettingsBloc _settingsBloc;

  @override
  SettingsScreenState createState() {
    return SettingsScreenState();
  }
}

class SettingsScreenState extends State<SettingsScreen> {
  SettingsScreenState();

  @override
  void initState() {
    super.initState();
  }

  List<SettingModel> searchResults = AppConstant.settingTitleList;

  void onQueryChanged(String query) {
    setState(() {
      searchResults = AppConstant.settingTitleList
          .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
        bloc: widget._settingsBloc,
        listener: (
          BuildContext context,
            SettingsState currentState,
        ) {
          if (currentState is LoadingSettingsState) {

          }
          if (currentState is ErrorSettingsState) {

          }
        },
        builder: (
          BuildContext context,
            SettingsState currentState,
        ) {
          return WillPopScope(
            onWillPop: () {
              Navigator.pop(context, true);
              return Future(() => false);
            },
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height *0.25,
                  color: HexColor('eff0f4'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //header profile & notification icon widget
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Center(
                              child: Column(
                                children: [
                                   CircleAvatar(
                                    minRadius: 40,
                                    backgroundColor: Colors.white,
                                    child: Image.asset("assets/images/${userDetailsModel.image}",width: 60.0, height: 60.0),
                                  ),
                                  const SizedBox(height: 12,),
                                  Text('${userDetailsModel.firstName} ${userDetailsModel.lastName}',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black),),
                                  const SizedBox(height: 4,),
                                  Text(userDetailsModel.email,style: const TextStyle(fontSize: 12,color: Colors.black),),
                                ],
                              ),
                            ),
                            const Positioned(
                                right: 16,
                                top: 0,
                                child: Text('Log Out',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w600),)
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 12,),
                    ],
                  ),
                ),
                const SizedBox(height: 24,),
                //Search Widget
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin:const EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                    cursorColor: Colors.grey,
                    onChanged: onQueryChanged,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        fillColor: HexColor('eff0f4'),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                        ),
                        hintText: 'Search Settings',
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16
                        ),
                        prefixIcon: const Icon(Icons.search,color: Colors.blueAccent,size: 24,)
                    ),
                  ),
                ),
                const SizedBox(height: 24,),
                //Activity List view
                Expanded(child: ListView.builder(
                    itemCount: searchResults.length,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index){
                      return SettingItemView(searchResults,index);
                    }))

              ],
            )
            ,
          );
        });
  }
}
