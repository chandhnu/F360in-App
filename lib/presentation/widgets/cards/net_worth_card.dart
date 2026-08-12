import 'package:flutter/material.dart';
import '../../../utils/currency_formatter.dart';

class NetWorthCard extends StatelessWidget {
  final double netWorth;
  final double trend;
  final String profileName;

  const NetWorthCard({
    required this.netWorth,
    required this.trend,
    required this.profileName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPositive = trend >= 0;
    final trendColor = isPositive ? Colors.green : Colors.red;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple.shade900, Colors.deepPurple.shade700],
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Net Worth', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.grey.shade400, fontSize: 12, letterSpacing: 1)),
                    const SizedBox(height: 8),
                    Text(CurrencyFormatter.format(netWorth), style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: trendColor.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Icon(isPositive ? Icons.trending_up : Icons.trending_down, size: 16, color: trendColor),
                      const SizedBox(width: 4),
                      Text('${isPositive ? '+' : ''}${trend.toStringAsFixed(1)}%', style: TextStyle(color: trendColor, fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('This Month', style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
