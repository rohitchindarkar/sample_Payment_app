// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromJson(jsonString);

import 'dart:convert';

late UserDetailsModel userDetailsModel;

setTraditionalLoginDataModel(UserDetailsModel obj) {
  userDetailsModel = obj;
}

UserDetailsModel userDetailsModelFromJson(String str) => UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) => json.encode(data.toJson());

class UserDetailsModel {
  int id;
  String firstName;
  String lastName;
  String email;
  String balance;
  String image;

  UserDetailsModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.balance,
    required this.image,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) => UserDetailsModel(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    balance: json["balance"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "balance": balance,
    "image": image,
  };
}
