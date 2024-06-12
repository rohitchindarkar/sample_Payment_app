import 'package:payment_application/utility/AppConstant.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase{

  static String localDatabaseName = 'payment_app_database.db';
  static String userTableName = 'user_details';
  static String activityTableName = 'activity_details';


  static openLocalDatabase() async{
    final db = await openDatabase(localDatabaseName);
  }

  // User Table Create
  static createUserTable() async{
    final db = await openDatabase(localDatabaseName);

    await db.execute(
      'CREATE TABLE if not exists $userTableName(id INTEGER PRIMARY KEY, first_name TEXT,last_name TEXT,email TEXT,balance TEXT,image TEXT)',
    );
  }

  // Insert User Data
  static insertUserData() async {

    final db = await openDatabase(localDatabaseName);
    await db.insert(userTableName, AppConstant.userData);
  }

  //get User Data
  static Future<List<Map<String, dynamic>>> retrieveUserData() async {

    final db = await openDatabase(localDatabaseName);
    try{
      return await db.query(userTableName);
    }catch(exception){
      return [];
    }
   ;
  }

  // Activity Table Create
  static createActivityTable() async{
    final db = await openDatabase(localDatabaseName);
try {
  await db.execute(
    'CREATE TABLE $activityTableName(id INTEGER PRIMARY KEY, title TEXT,short_desc TEXT,address TEXT,amount INTEGER,sender_name TEXT,sender_mobile_no TEXT,sender_image TEXT,tran_date_time TEXT,return_date_time TEXT)',
  );
}catch(e){
  print(e.toString());
}
  }

  // Insert User Data
  static insertActivityData(activityData) async {
    final db = await openDatabase(localDatabaseName);
    await db.insert(activityTableName, activityData);
  }

  //get Activity Data
  static Future<List<Map<String, dynamic>>> retrieveActivityData() async {

    final db = await openDatabase(localDatabaseName);
    try{
      return await db.query(activityTableName);
    }catch(exception){
      return [];
    }
    ;
  }

}