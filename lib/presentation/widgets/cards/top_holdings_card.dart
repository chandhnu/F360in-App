import 'package:flutter/material.dart';
import '../../../utils/currency_formatter.dart';

class TopHoldingsCard extends StatelessWidget {
  final Map<String, dynamic> holdings;
  const TopHoldingsCard({required this.holdings, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final holdingsList = holdings['holdings'] as List<dynamic>;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Top Holdings', style: Theme.of(context).textTheme.headlineSmall),
                Text('View All', style: TextStyle(color: Colors.blue.shade400, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: holdingsList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) => _HoldingItem(holding: holdingsList[index] as Map<String, dynamic>),
            ),
          ],
        ),
      ),
    );
  }
}

class _HoldingItem extends StatelessWidget {
  final Map<String, dynamic> holding;
  const _HoldingItem({required this.holding});

  Color _getTypeColor(String type) {
    switch (type) {
      case 'EQUITY': return Colors.blue;
      case 'MUTUAL_FUND': return Colors.purple;
      case 'DEBT': return Colors.green;
      default: return Colors.grey;
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type) {
      case 'EQUITY': return Icons.trending_up;
      case 'MUTUAL_FUND': return Icons.waterfall_chart;
      case 'DEBT': return Icons.savings;
      default: return Icons.help;
    }
  }

  @override
  Widget build(BuildContext context) {
    final xirr = holding['xirr'] as double;
    final isPositive = xirr >= 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade700, width: 0.5),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: _getTypeColor(holding['type']).withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
            child: Icon(_getTypeIcon(holding['type']), size: 16, color: _getTypeColor(holding['type'])),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(holding['name'], style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(holding['quantity'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(CurrencyFormatter.format(holding['value']), style: const TextStyle(fontWeight: FontWeight.w600)),
              Row(
                children: [
                  Icon(isPositive ? Icons.arrow_drop_up : Icons.arrow_drop_down, size: 16, color: isPositive ? Colors.green : Colors.red),
                  Text('${xirr.toStringAsFixed(1)}% XIRR', style: TextStyle(fontSize: 12, color: isPositive ? Colors.green : Colors.red, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
