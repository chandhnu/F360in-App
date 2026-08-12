import 'package:intl/intl.dart';
import 'constants.dart';

class CurrencyFormatter {
  static String format(dynamic amount, {String currency = 'INR'}) {
    try {
      final formatter = NumberFormat.currency(symbol: AppConstants.currencySymbol);
      return formatter.format(amount);
    } catch (e) {
      return '${AppConstants.currencySymbol} $amount';
    }
  }

  static String formatCompact(dynamic amount) {
    try {
      final num value = num.parse(amount.toString());
      if (value >= 1000000) {
        return '${(value / 1000000).toStringAsFixed(1)}L';
      } else if (value >= 100000) {
        return '${(value / 100000).toStringAsFixed(1)}Lakh';
      } else if (value >= 1000) {
        return '${(value / 1000).toStringAsFixed(1)}K';
      }
      return value.toStringAsFixed(0);
    } catch (e) {
      return '$amount';
    }
  }
}
