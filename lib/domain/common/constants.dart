
class AppContatants{
//static String mainUrl = "http://167.71.143.107";//real URL
static String mainUrl = "http://192.168.13.138:8002";//test URL

  //static String addition = "/api/api/m_statistics/";//real
  static String addition = "/api/";//test
   
  static String login = '${addition}login';
  static String order = '${addition}m_delivery_order';
  static String confirm = '${addition}m_confirm_delivery';
  static String completed = '${addition}m_delivery_order';
  static String canceledItems = '${addition}m_delivery_cancel_reasons';
  static String canceled = '${addition}m_cancel_delivery';
  static String region = '${addition}m_regions/';
  static String village = '${addition}m_villages/';

  static String appVersion = '1.2.2';

    static int duration = 200;

}