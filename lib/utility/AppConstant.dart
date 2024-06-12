import 'dart:async';

import 'package:flutter/material.dart';
import 'package:payment_application/utility/AppUtility.dart';
import '../models/settings/settings_model.dart';

class AppConstant {

  // Bottom navigation last selected Index
  static int footerSelectedIndex = 0;

  // Setting Label
  static List<SettingModel> settingTitleList = [
    SettingModel(title: 'Personal Info',icons:Icons.account_circle_rounded ),
    SettingModel(title: 'My QR Code',icons:Icons.qr_code_scanner_rounded ),
    SettingModel(title: 'Banks and Cards',icons:Icons.business_sharp ),
    SettingModel(title: 'Payment Preferences',icons:Icons.call_to_action ),
    SettingModel(title: 'Automatic Payment',icons:Icons.refresh_rounded ),
    SettingModel(title: 'Login and Security',icons:Icons.login_outlined ),
    SettingModel(title: 'Notification',icons:Icons.notifications ),
  ];

//User Sample Data
  static Map<String, dynamic> userData = {
    'first_name' : 'Tony',
    'last_name'  : 'Stark',
    'email'  : 'tony_Stark@gmail.com',
    'balance'  : '5000',
    'image':'user_image.png'
  };

  //Activity Sample Data
  static List<Map<String, dynamic>> activityListData = [
    {
      'title' : 'Apple Store',
      'short_desc'  : 'Apple MacBook Pro 16',
      'address'  : '5000',
      'amount': 3234.03,
      'sender_name': 'Amit Mehta',
      'sender_mobile_no': '+91 9876786754',
      'sender_image': 'sender_image1.png',
      'tran_date_time': AppUtility.formatDateTime(DateTime.now()),
      'return_date_time': AppUtility.formatDateTime(DateTime.now().add(const Duration(days: 40))),
    },
    {
      'title' : 'Samsung Mobile Store',
      'short_desc'  : 'Samsung Mobile Galaxy S24 ',
      'address'  : 'Powai east,Mumbai.',
      'amount': 1000.03,
      'sender_name': 'Nishit Patel',
      'sender_mobile_no': '+91 9876787656',
      'sender_image': 'sender_image2.png',
      'tran_date_time': AppUtility.formatDateTime(DateTime.now()),
      'return_date_time': AppUtility.formatDateTime(DateTime.now().add(Duration(days: 30))),
    },
    {
      'title' : 'Samsung Mobile Store',
      'short_desc'  : 'Samsung 40 inch Tv',
      'address'  : 'Thane west,400606.',
      'amount': 2500.05,
      'sender_name': 'Nishit Patel',
      'sender_mobile_no': '+91 9876787656',
      'sender_image': 'sender_image2.png',
      'tran_date_time': AppUtility.formatDateTime(DateTime.now()),
      'return_date_time': AppUtility.formatDateTime(DateTime.now().add(Duration(days: 90))),
    },
    {
      'title' : 'Reliance Digital',
      'short_desc'  : 'Washing Machine - Automatic - 10 ltr',
      'address'  : 'Dadar west,Mumbai.',
      'amount': 2000.00,
      'sender_name': 'Yogesh Sharma',
      'sender_mobile_no': '+91 6756789876',
      'sender_image': 'sender_image3.png',
      'tran_date_time': AppUtility.formatDateTime(DateTime.now()),
      'return_date_time': AppUtility.formatDateTime(DateTime.now().add(Duration(days: 10))),
    },
    {
      'title' : 'Wood Land',
      'short_desc'  : 'Sofa Bed - king Size',
      'address'  : 'Thane west,400606.',
      'amount': 1500.05,
      'sender_name': 'Neha Verma',
      'sender_mobile_no': '+91 7865789874',
      'sender_image': 'sender_image4.png',
      'tran_date_time': AppUtility.formatDateTime(DateTime.now()),
      'return_date_time': AppUtility.formatDateTime(DateTime.now().add(Duration(days: 20))),
    },
    {
      'title' : 'S-mart',
      'short_desc'  : 'Grocery Shopping',
      'address'  : 'Thane west,400606.',
      'amount': 500.05,
      'sender_name': 'Nikita Das',
      'sender_mobile_no': '+91 7865789874',
      'sender_image': 'sender_image5.png',
      'tran_date_time': AppUtility.formatDateTime(DateTime.now()),
      'return_date_time': AppUtility.formatDateTime(DateTime.now().add(Duration(days: 2))),
    },
    {
      'title' : 'Food court',
      'short_desc'  : 'Dinner ',
      'address'  : 'Thane west,400606.',
      'amount': 900.05,
      'sender_name': 'Raj Singh',
      'sender_mobile_no': '+91 2345674567',
      'sender_image': 'sender_image6.png',
      'tran_date_time': AppUtility.formatDateTime(DateTime.now()),
      'return_date_time': AppUtility.formatDateTime(DateTime.now().add(Duration(days: 35))),
    },

  ];

}