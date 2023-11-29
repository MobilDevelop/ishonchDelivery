import 'dart:math' as math;
import 'package:easy_localization/easy_localization.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kuryer/infrastructure/models/universal/location.dart';
import 'package:location/location.dart';

class Helper{
  static int randomNumber(){
      math.Random rng = math.Random();
      return rng.nextInt(17);
  }

  static String dateFormat(DateTime? date){
      return date==null?"": DateFormat('yyyy-MM-dd').format(date);
  }

  static String dateTimeFormat(){
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
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

//  Future<LocationObject> getCurrentLocation(Location location) async {
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;
//     LocationData _locationData;
//     LocationObject locationObject = LocationObject(latitude: '-1', longtude: '-1');
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return Future.value(LocationObject(latitude: "-1", longtude: '-1'));
//       }
//     }

//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//       return Future.value(LocationObject(latitude: "-1", longtude: '-1'));
//       }
//     }

//     _locationData = await location.getLocation();

//     if (_locationData.accuracy! <= 100) {
//       if (!_locationData.isMock!) {
//         locationObject = LocationObject(latitude: _locationData.latitude.toString(), longtude: _locationData.longitude.toString());
//       }
//     }
//     return Future.value(locationObject);
//   }

  Future<Position> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

}