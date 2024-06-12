// To parse this JSON data, do
//
//     final activityDetailsModel = activityDetailsModelFromJson(jsonString);

import 'dart:convert';

late List<ActivityDetailsModel>  activityListModel;

setActivityListDataModel(List<ActivityDetailsModel>  obj) {
  activityListModel = obj;
}
List<ActivityDetailsModel> activityDetailsModelFromJson(String str) => List<ActivityDetailsModel>.from(json.decode(str).map((x) => ActivityDetailsModel.fromJson(x)));

String activityDetailsModelToJson(List<ActivityDetailsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActivityDetailsModel {
  String title;
  String shortDesc;
  String address;
  double amount;
  String senderName;
  String senderMobileNo;
  String senderImage;
  String tranDateTime;
  String returnDateTime;

  ActivityDetailsModel({
    required this.title,
    required this.shortDesc,
    required this.address,
    required this.amount,
    required this.senderName,
    required this.senderMobileNo,
    required this.senderImage,
    required this.tranDateTime,
    required this.returnDateTime,
  });

  factory ActivityDetailsModel.fromJson(Map<String, dynamic> json) => ActivityDetailsModel(
    title: json["title"],
    shortDesc: json["short_desc"],
    address: json["address"],
    amount: json["amount"]?.toDouble(),
    senderName: json["sender_name"],
    senderMobileNo: json["sender_mobile_no"],
    senderImage: json["sender_image"],
    tranDateTime: json["tran_date_time"],
    returnDateTime: json["return_date_time"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "short_desc": shortDesc,
    "address": address,
    "amount": amount,
    "sender_name": senderName,
    "sender_mobile_no": senderMobileNo,
    "sender_image": senderImage,
    "tran_date_time": tranDateTime,
    "return_date_time": returnDateTime,
  };
}
