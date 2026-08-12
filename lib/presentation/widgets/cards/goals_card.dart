import 'package:flutter/material.dart';
import '../../../utils/currency_formatter.dart';

class GoalsCard extends StatelessWidget {
  final List<Map<String, dynamic>> goals;
  const GoalsCard({required this.goals, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Financial Goals', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: goals.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) => _GoalItem(goal: goals[index]),
            ),
          ],
        ),
      ),
    );
  }
}

class _GoalItem extends StatelessWidget {
  final Map<String, dynamic> goal;
  const _GoalItem({required this.goal});

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'HIGH': return Colors.red;
      case 'MEDIUM': return Colors.orange;
      case 'LOW': return Colors.blue;
      default: return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = goal['progress'] as int;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(goal['goalName'], style: const TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(color: _getPriorityColor(goal['priority']).withOpacity(0.2), borderRadius: BorderRadius.circular(4)),
                        child: Text(goal['priority'], style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: _getPriorityColor(goal['priority']))),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text('Target: ${CurrencyFormatter.format(goal['targetAmount'])} by ${goal['targetDate']}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            Text('${progress}%', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress / 100,
            minHeight: 6,
            backgroundColor: Colors.grey.shade700,
            valueColor: AlwaysStoppedAnimation<Color>(progress >= 75 ? Colors.green : progress >= 50 ? Colors.blue : Colors.orange),
          ),
        ),
        const SizedBox(height: 8),
        Text('${CurrencyFormatter.format(goal['currentAmount'])} accumulated', style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }
}
