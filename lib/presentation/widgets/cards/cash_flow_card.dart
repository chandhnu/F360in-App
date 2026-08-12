import 'package:flutter/material.dart';
import '../../../utils/currency_formatter.dart';

class CashFlowCard extends StatelessWidget {
  final double income;
  final double expenses;
  const CashFlowCard({required this.income, required this.expenses, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final netFlow = income - expenses;
    final isPositive = netFlow >= 0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cash Flow (This Month)', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: _CashFlowItem(label: 'Income', amount: income, color: Colors.teal)),
                const SizedBox(width: 16),
                Expanded(child: _CashFlowItem(label: 'Expenses', amount: expenses, color: Colors.orange)),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: isPositive ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Net Flow', style: Theme.of(context).textTheme.bodyMedium),
                  Text(CurrencyFormatter.format(netFlow), style: TextStyle(fontWeight: FontWeight.bold, color: isPositive ? Colors.green : Colors.red)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CashFlowItem extends StatelessWidget {
  final String label;
  final double amount;
  final Color color;

  const _CashFlowItem({required this.label, required this.amount, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 12, height: 12, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
        const SizedBox(height: 8),
        Text(CurrencyFormatter.format(amount), style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
