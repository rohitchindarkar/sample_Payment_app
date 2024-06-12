
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payment_application/features/dashboard/index.dart';
import 'package:payment_application/models/dashboard/activity_details_model.dart';
import 'package:payment_application/utility/AppUtility.dart';
import 'package:payment_application/utility/HexColor.dart';
import 'package:payment_application/widgets/dashboard/send_again_item_view.dart';
import 'package:payment_application/widgets/dashboard/user_Image_shimmer.dart';
import 'package:payment_application/widgets/dashboard/user_name_shimmer.dart';
import 'package:payment_application/widgets/search_screen.dart';

import '../../models/user_details/user_details_model.dart';
import '../../widgets/dashboard/activity_listview_shimmer.dart';
import '../../widgets/dashboard/your_activity_item_view.dart';



class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    Key? key,
    required DashboardBloc dashboardBloc,
  })  : _dashboardBloc = dashboardBloc,
        super(key: key);

  final DashboardBloc _dashboardBloc;

  @override
  DashboardScreenState createState() {
    return DashboardScreenState();
  }
}

class DashboardScreenState extends State<DashboardScreen> {
  DashboardScreenState();

  bool isUserDataCalled = false;
  bool isActivtyDataCalled = false;

  List<ActivityDetailsModel> sendAgainActivityList =[];
  late List<ActivityDetailsModel>  yourActivityList = [];
  @override
  void initState() {

    // Call User Details
    widget._dashboardBloc.add(GetUserDataEvent());
    // Call Activity Details
    widget._dashboardBloc.add(GetActivityDataEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
        bloc: widget._dashboardBloc,
        listener: (
          BuildContext context,
            DashboardState currentState,
        ) {
          if (currentState is LoadingDashboardState) {
            if(currentState.fromEvent == 'getActivity'){
              isActivtyDataCalled = false;
            }else if(currentState.fromEvent == 'userDetails'){
              isUserDataCalled = false;
            }
          }
          if (currentState is GetUserDetailsState) {
            isUserDataCalled = true;
          }
          if (currentState is GetActivityDetailsState) {
            isActivtyDataCalled = true;
           sendAgainActivityList = activityListModel;
            yourActivityList = activityListModel;
            final ids = sendAgainActivityList.map((e) => e.senderName).toSet();
            sendAgainActivityList.retainWhere((x) => ids.remove(x.senderName));
          }
          if (currentState is ErrorDashboardState) {

          }
        },
        builder: (
          BuildContext context,
            DashboardState currentState,
        ) {
          return WillPopScope(
            onWillPop: () {
              Navigator.pop(context, true);
              return Future(() => false);
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height *0.44,

                    color: HexColor('eff0f4'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //header profile & notification icon widget
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height *0.1,
                          child: Stack(
                            children: [
                              Positioned(
                                top:36,
                                left: 16,
                                child: Row(
                                  children: [
                                    isUserDataCalled ?CircleAvatar(
                                      minRadius: 25,
                                      backgroundColor: Colors.white,
                                      child: Image.asset("assets/images/${userDetailsModel.image}",width: 40.0, height: 40.0,),
                                    ):const UserImageShimmer(),
                                    const SizedBox(width: 12,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children:  [
                                        isUserDataCalled ?
                                        Text('Hi ${userDetailsModel.firstName},',style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),):
                                        const UserNameShimmer(20,35),
                                        const SizedBox(height: 4,),
                                        const Text("Here's your spending dashboard",style: TextStyle(fontSize: 14,color: Colors.black),),
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              Positioned(
                                  right: 12,
                                  top: 12,
                                  child: Stack(
                                    children: <Widget>[
                                       Icon(Icons.notifications,color: Colors.grey.shade400,),

                                       Positioned(
                                        right: 0,
                                        child:  Container(
                                          padding: const EdgeInsets.all(1),
                                          decoration:  BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          constraints: const BoxConstraints(
                                            minWidth: 12,
                                            minHeight: 12,
                                          ),
                                          child:  const Text(
                                            '5',
                                            style:  const TextStyle(
                                              color: Colors.white,
                                              fontSize: 8,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 12,),
                        //balance widget
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.16,
                          padding: const EdgeInsets.symmetric(horizontal: 16,),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  [
                                    isUserDataCalled ? Text('\$${AppUtility.amountFormat(double.parse(userDetailsModel.balance))}',style: const TextStyle(fontSize: 28,fontWeight: FontWeight.w500,color: Colors.black)):
                                    const UserNameShimmer(40,35),
                                    const Text('Your Balance',style: TextStyle(fontSize: 12,color: Colors.black)),
                                  ],
                                )),
                                Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 18,),
                                    child: VerticalDivider(thickness: 1,color: Colors.grey.shade300,)),
                                Expanded(child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Text('30',style: TextStyle(fontSize: 36,fontWeight: FontWeight.w500,color: Colors.blueAccent)),
                                        Text('Last Days',style: TextStyle(fontSize: 12,color: Colors.black)),
                                      ],
                                    ),
                                    const Icon(Icons.arrow_drop_down_sharp,size: 36,color: Colors.blueAccent,)
                                  ],
                                )
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Send Again Label
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal:24,vertical: 18 ),
                          child: Text('Send Again',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black)),
                        ),
                        //Send Again horizontal Listview
                        Container(
                          padding: const EdgeInsets.only(left: 16,top: 0),
                          height: 100,
                          child: isActivtyDataCalled?ListView.builder(
                              itemCount: sendAgainActivityList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index){
                                return SendAgainItemView(sendAgainActivityList[index]);
                              }):const SizedBox(),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24,),
                  //Search Widget
                  GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, SearchScreen.routeName);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        margin:const EdgeInsets.symmetric(horizontal: 24),
                        child:
                        TextField(
                          cursorColor: Colors.grey,
                          enabled: false,
                          autofocus:false,
                          onTap: (){
                            Navigator.pushNamed(context, SearchScreen.routeName);
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none
                              ),
                              hintText: 'Search Transactions',
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16
                              ),
                              prefixIcon: const Icon(Icons.search,color: Colors.blueAccent,size: 24,)
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 24,),
                  //Your Activity Label
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Your Activity',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black)),
                          Icon(Icons.sort,color: Colors.blueAccent,)
                        ],
                      ) ,),
                  const SizedBox(height: 24,),
                  //Activity List view
                  isActivtyDataCalled? ListView.builder(
                      itemCount: yourActivityList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index){
                        return YourActivityItemView(yourActivityList[index]);
                      }):const ActivityListViewShimmer()
                ]
              ),
            )
            ,
          );
        });
  }

}
