import 'package:flutter/material.dart';
import '../../../utils/currency_formatter.dart';

class RecentTransactionsCard extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;
  const RecentTransactionsCard({required this.transactions, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Transactions', style: Theme.of(context).textTheme.headlineSmall),
                Text('View All', style: TextStyle(color: Colors.blue.shade400, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              separatorBuilder: (_, __) => const Divider(height: 16),
              itemBuilder: (context, index) {
                final tx = transactions[index];
                return _TransactionItem(transaction: tx);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final Map<String, dynamic> transaction;
  const _TransactionItem({required this.transaction});

  Color _getTypeColor(String type) {
    switch (type) {
      case 'INCOME': return Colors.green;
      case 'INVESTMENT': return Colors.blue;
      case 'EXPENSE': return Colors.orange;
      case 'LIABILITY': return Colors.red;
      default: return Colors.grey;
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type) {
      case 'INCOME': return Icons.trending_up;
      case 'INVESTMENT': return Icons.trending_up;
      case 'EXPENSE': return Icons.trending_down;
      case 'LIABILITY': return Icons.arrow_upward;
      default: return Icons.help;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: _getTypeColor(transaction['type']).withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
          child: Icon(_getTypeIcon(transaction['type']), size: 16, color: _getTypeColor(transaction['type'])),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(transaction['description'], style: const TextStyle(fontWeight: FontWeight.w500)),
              Text('${transaction['date']} • ${transaction['account']}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
        Text(
          transaction['type'] == 'INCOME' || transaction['type'] == 'INVESTMENT'
              ? '+${CurrencyFormatter.format(transaction['amount'])}'
              : '-${CurrencyFormatter.format(transaction['amount'])}',
          style: TextStyle(fontWeight: FontWeight.bold, color: transaction['type'] == 'INCOME' || transaction['type'] == 'INVESTMENT' ? Colors.green : Colors.grey),
        ),
      ],
    );
  }
}
