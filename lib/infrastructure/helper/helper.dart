import 'dart:math' as math;
import 'package:easy_localization/easy_localization.dart';

class Helper{
  static int randomNumber(){
      math.Random rng = math.Random();
      return rng.nextInt(17);
  }

  static String dateFormat(DateTime? date){
      return date==null?"": DateFormat('yyyy-MM-dd').format(date);
  }

  static String formatDate() {
    DateTime date = DateTime.now();
    String month='';
    switch (date.month) {
      case 1:month="Yanvar"; break;
      case 2:month="Fevral"; break;
      case 3:month="Mart"; break;
      case 4:month="Aprel"; break;
      case 5:month="May"; break;
      case 6:month="Iyun"; break;
      case 7:month="Iyul"; break;
      case 8:month="Avgust"; break;
      case 9:month="Sentabr"; break;
      case 10:month="Oktabr"; break;
      case 11:month="Noyabr"; break;
      case 12:month="Dekabr"; break;
    }
    return "${date.day}-$month, ${date.year}-yil";
  }

 

  static int percentageInfo(dynamic money1,dynamic money2){
     dynamic money1ABC = money1>=0?money1:(money1*-1);
     dynamic answer = money2!=0?(money1ABC/money2)*100:0;
     return answer==0?0:answer.round();
  }

  static String toProcessCost(String value) {
    if (value == '0') {
      return '0';
    }

    String valueRealPart = '';
    String number = "";
    if (value.indexOf('.') > 0) {
      valueRealPart = value.substring(value.indexOf('.'), value.length);
      value = value.substring(0, value.indexOf('.'));
    }
    String count = '';
    if (value.length > 3) {
      int a = 0;
      for (int i = value.length; 0 < i; i--) {
        if (a % 3 == 0) {
          count = '${value.substring(i - 1, i)} $count';
        } else {
          count = value.substring(i - 1, i) + count;
        }
        a++;
      }
    } else {
      count = value;
    }
  //   if(value.length>=10){
  //    int coast = int.parse(value);
  //    String million = (coast/1000000000).toString();
    
  //   return "$million mlrd so'm";
  //  }

  //  if(value.length>=7){
  //    int coast = int.parse(value);
  //    String million = (coast/1000000).toString();
    
  //   return "$million mln so'm";
  //  }
    return "$count so'm";
  }

  static String toProcessCostOnly(String value) {
    if (value == '0') {
      return '0';
    }

    String valueRealPart = '';
    String number = "";
    if (value.indexOf('.') > 0) {
      valueRealPart = value.substring(value.indexOf('.'), value.length);
      value = value.substring(0, value.indexOf('.'));
    }
    String count = '';
    if (value.length > 3) {
      int a = 0;
      for (int i = value.length; 0 < i; i--) {
        if (a % 3 == 0) {
          count = '${value.substring(i - 1, i)} $count';
        } else {
          count = value.substring(i - 1, i) + count;
        }
        a++;
      }
    } else {
      count = value;
    }
    return count;
  }

}