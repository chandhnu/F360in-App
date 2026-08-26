import 'package:flutter/material.dart';

void main() {
  runApp(const F360inApp());
}

class F360inApp extends StatelessWidget {
  const F360inApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F360in - Personal Wealth OS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data from your Excel
    const netWorth = 50000000.0; // ₹50L from your assets
    const monthlyIncome = 169170.0; // From your payslip
    const monthlyExpenses = 120000.0; // Fixed + Variable
    const monthlySurplus = monthlyIncome - monthlyExpenses;

    return Scaffold(
      appBar: AppBar(
        title: const Text('F360in Dashboard'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // KPI Cards
            Row(
              children: [
                Expanded(
                  child: _KPICard(
                    title: 'Net Worth',
                    value: '₹${(netWorth / 10000000).toStringAsFixed(1)}Cr',
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _KPICard(
                    title: 'Monthly Income',
                    value: '₹${monthlyIncome.toStringAsFixed(0)}',
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _KPICard(
                    title: 'Monthly Expense',
                    value: '₹${monthlyExpenses.toStringAsFixed(0)}',
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _KPICard(
                    title: 'Monthly Surplus',
                    value: '₹${monthlySurplus.toStringAsFixed(0)}',
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              'Dashboard Status',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('✅ Dashboard UI working!'),
                  const SizedBox(height: 8),
                  const Text('✅ Displaying financial metrics'),
                  const SizedBox(height: 8),
                  const Text('✅ Ready for Excel integration'),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'Next: Integrate live Excel data reader',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _KPICard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _KPICard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
