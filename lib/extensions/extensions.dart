import 'package:instagram_clone/constants/others.dart';
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String getHour() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  String getDateHumanized() {
    final now = DateTime.now();
    final current = DateTime(year, month, day, hour, minute, second);
    final difference = now.difference(current);

    String word;

    if (difference.inDays > 10) {
      return '${current.day} de ${calendar[current.month]} de ${current.year}';
    }

    if (difference.inDays > 0 && difference.inDays <= 10) {
      var value = difference.inDays;
      word = value == 1 ? 'día' : 'días';
      return 'Hace $value $word';
    }

    if (difference.inDays == 0 && difference.inSeconds > 60) {
      var value = difference.inMinutes;
      word = value == 1 ? 'minuto' : 'minutos';
      return 'Hace $value $word';
    }

    if (difference.inDays == 0 && difference.inMinutes < 1) {
      var value = difference.inSeconds;
      word = value == 1 ? 'segundo' : 'segundos';
      return 'Hace $value $word';
    }
    return '';
  }
}

extension IntExtensions on int {
  String formatWithSeparator() => NumberFormat('#,###', 'es_ES').format(this);
  String formatWithWords() {
    var value = formatWithSeparator();
    if (value.length == 6) {
      return "${value.substring(0, 4)} mil";
    }
    if (value.length == 7) {
      return "${value.substring(0, 3)} mil";
    }
    return value;
  }
}
