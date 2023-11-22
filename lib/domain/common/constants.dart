import 'package:flutter/material.dart';

class AppContatants{
static String mainUrl = "http://167.71.143.107";//real URL
//static String mainUrl = "http://192.168.13.141:8009";//test URL

  static String addition = "/api/api/m_statistics/";//real
  //static String addition = "/api/m_statistics/";//test
   
  static String getSearch = '/api/api/m_regions';
  static String auth = '/api//api/sign-in';
  static String star = '/api/api/m_statistics';
  static String organizations = '${addition}organization';
  static String region = '${addition}region';
  static String payment = '${addition}payment_form';
  static String term = '${addition}term';
  static String portfolio = '${addition}portfolio';
  

  static String appVersion = '1.2.2';

  static int duration = 200;

  static List<Color> colorsList = [
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.amber,
    Colors.tealAccent,
    Colors.purpleAccent,
    Colors.indigoAccent,
    Colors.teal,
    Colors.blueAccent,
    Colors.cyan,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.indigo,
    Colors.orange,
  ];

}