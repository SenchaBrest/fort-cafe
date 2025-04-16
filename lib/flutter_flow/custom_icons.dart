import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _loadFamily = 'Load';
  static const String _waitFamily = 'Wait';
  static const String _hourglassFamily = 'Hourglass';
  static const String _crosstickFamily = 'Crosstick';
  static const String _notdoneFamily = 'Notdone';
  static const String _crossTimeTickFamily = 'CrossTimeTick';
  static const String _crossHourglassTickFamily = 'CrossHourglassTick';

  // load
  static const IconData kload = IconData(0xe000, fontFamily: _loadFamily);

  // wait
  static const IconData kwait = IconData(0xe000, fontFamily: _waitFamily);

  // hourglass
  static const IconData khourglass =
      IconData(0xe000, fontFamily: _hourglassFamily);

  // crosstick
  static const IconData kcrosstick =
      IconData(0xe000, fontFamily: _crosstickFamily);

  // notdone
  static const IconData knotdone = IconData(0xe000, fontFamily: _notdoneFamily);

  // cross_time_tick
  static const IconData kcrossTimeTick =
      IconData(0xe000, fontFamily: _crossTimeTickFamily);

  // cross_hourglass_tick
  static const IconData kcrossHourglassTick =
      IconData(0xe000, fontFamily: _crossHourglassTickFamily);
}
