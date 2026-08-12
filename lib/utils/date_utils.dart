import 'package:intl/intl.dart';

class DateFormatUtils {
  static String formatDate(DateTime date) => DateFormat('dd MMM yyyy').format(date);
  static String formatDateShort(DateTime date) => DateFormat('dd/MM/yy').format(date);
  static String formatDateISO(DateTime date) => date.toIso8601String().split('T')[0];
  static String formatMonthYear(DateTime date) => DateFormat('MMMM yyyy').format(date);
  static bool isSameDay(DateTime a, DateTime b) => a.year == b.year && a.month == b.month && a.day == b.day;
  static bool isSameMonth(DateTime a, DateTime b) => a.year == b.year && a.month == b.month;
}
