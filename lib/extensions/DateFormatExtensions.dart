import 'package:intl/intl.dart';

extension DateFormatExtension on DateTime {
  String format({String dateFormat = "yyyy/MM/dd"}){
    return DateFormat(dateFormat).format(this).toString();
  }
}