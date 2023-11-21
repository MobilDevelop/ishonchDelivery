import 'dart:ui';

abstract class BaseColors {
  const BaseColors();

  Color get primary => const Color.fromRGBO(23,32,58, 1);
  Color get secondary => const Color.fromRGBO(103, 146, 255, 1);
  Color get white => const Color.fromRGBO(255, 255, 255, 1);
  Color get white12 => const Color.fromRGBO(238,238,238, 1);

  Color get stroke => const Color.fromRGBO(50, 58, 70, 1);
  Color get information => const Color.fromRGBO(55, 135, 255, 1);

  Color get yellow => const Color.fromRGBO(255, 255, 0, 1);
  Color get orange => const Color.fromRGBO(255, 165, 0, 1);
  Color get grey => const Color.fromRGBO(169,169,169, 1);
  Color get red => const Color.fromRGBO(213, 57, 64, 1);
  Color get red900 => const Color.fromRGBO(233, 57, 64, 1);

  Color get black => const Color.fromRGBO(0, 0, 0, 1);
  Color get text900 => const Color.fromRGBO(0, 0, 0, 1);
  Color get text800 => const Color.fromRGBO(54, 69, 79, 1);
  Color get text700 => const Color.fromRGBO(51, 51, 51, 1);

  Color get textSecondary => const Color.fromRGBO(137, 143, 147, 1);

  Color get background;
}
