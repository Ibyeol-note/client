import 'package:intl/intl.dart';

extension DatetimeParse on DateTime {
  String kor() {
    return DateFormat('yyyy년 MM월 dd일 HH시 mm분').format(this);
  }
}
