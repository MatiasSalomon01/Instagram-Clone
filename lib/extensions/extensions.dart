import 'package:instagram_clone/constants/others.dart';

extension DateTimeExtensions on DateTime {
  String getHour() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  String getDateHumanized() {
    final now = DateTime.now();
    final current = DateTime(year, month, day, hour, minute, second);
    final difference = now.difference(current);
    if (difference.inDays > 10)
      return '${current.day} de ${calendar[current.month]} de ${current.year}';
    if (difference.inDays > 0 && difference.inDays <= 10)
      return 'Hace ${difference.inDays} días';
    if (difference.inDays == 0 && difference.inSeconds > 60)
      return 'Hace ${difference.inMinutes} minutos';
    if (difference.inDays == 0 && difference.inMinutes < 1)
      return 'Hace ${difference.inSeconds} segundos';
    return '';
  }
}
