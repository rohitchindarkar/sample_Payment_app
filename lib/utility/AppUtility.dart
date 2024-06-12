import 'package:intl/intl.dart';

class AppUtility{

  static formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }

  static getWeekDifference(DateTime from) {
     DateTime currentDate = DateTime.now();
    from = DateTime(from.year, from.month, from.day);
    currentDate = DateTime(currentDate.year, currentDate.month, currentDate.day);

    int days = (currentDate.difference(from).inHours / 24).round();
     days = days.abs();
    String returnData = '';
    if(days<7){
      returnData = "$days days";
    }else{
      returnData = "${(days/7).ceil()} ${(days/7).ceil() == 1 ? 'week':'weeks'} ";
    }
    return returnData;
  }

  static amountFormat(double amount) {
    final numberFormat = NumberFormat("#,##0.00", "en_US");
    return numberFormat.format(amount).toString();
  }

}