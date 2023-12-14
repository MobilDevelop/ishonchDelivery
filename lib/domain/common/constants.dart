
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppContatants{

  static String addition = dotenv.env['addition']!;//test
   
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