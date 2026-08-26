import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'services/excel_reader.dart';
import 'models/excel_models.dart';

void main() {
  runApp(const ProviderScope(child: F360inApp()));
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

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  late Future<Map<String, dynamic>> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = ExcelReader.readAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('F360in Dashboard'),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error loading data: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          }

          final data = snapshot.data!;
          return _buildDashboard(data);
        },
      ),
    );
  }

  Widget _buildDashboard(Map<String, dynamic> data) {
    final incomes = (data['income'] as List<Income>?) ?? [];
    final expensesFixed = (data['expensesFixed'] as List<ExpenseFixed>?) ?? [];
    final expensesVariable =
        (data['expensesVariable'] as List<ExpenseVariable>?) ?? [];
    final liabilities = (data['liabilities'] as List<Liability>?) ?? [];
    final assets = (data['assets'] as List<Asset>?) ?? [];
    final equityShares = (data['equityShares'] as List<EquityShare>?) ?? [];

    // Calculate metrics
    final netWorth = _calculateNetWorth(assets, liabilities);
    final monthlyIncome = _calculateMonthlyIncome(incomes);
    final monthlyExpenses =
        _calculateMonthlyExpenses(expensesFixed, expensesVariable);
    final monthlySurplus = monthlyIncome - monthlyExpenses;

    return SingleChildScrollView(
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
                  value: '₹${netWorth.toStringAsFixed(0)}',
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
                  color: monthlySurplus >= 0 ? Colors.teal : Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Data Summary
          Text(
            'Financial Summary',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          _SummaryCard(
            title: 'Assets',
            value: assets.length,
            description: '${assets.length} asset entries',
          ),
          _SummaryCard(
            title: 'Equity Shares',
            value: equityShares.length,
            description: '${equityShares.length} stock holdings',
          ),
          _SummaryCard(
            title: 'Income Sources',
            value: incomes.length,
            description: '${incomes.length} income streams',
          ),
          _SummaryCard(
            title: 'Liabilities',
            value: liabilities.length,
            description: '${liabilities.length} loans/debts',
          ),
          const SizedBox(height: 32),
          // Status
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dashboard Status',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  '✅ Excel data loaded successfully',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '✅ ${incomes.length + expensesFixed.length + expensesVariable.length} financial entries parsed',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '✅ Net worth calculated from ${assets.length} assets',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  double _calculateNetWorth(List<Asset> assets, List<Liability> liabilities) {
    double totalAssets =
        assets.fold(0, (sum, asset) => sum + asset.currentValue);
    double totalLiabilities =
        liabilities.fold(0, (sum, liability) => sum + liability.amount);
    return totalAssets - totalLiabilities;
  }

  double _calculateMonthlyIncome(List<Income> incomes) {
    double total = 0;
    for (final income in incomes) {
      if (income.frequency.toLowerCase() == 'monthly') {
        total += income.amount;
      } else if (income.frequency.toLowerCase() == 'annual') {
        total += income.amount / 12;
      }
    }
    return total;
  }

  double _calculateMonthlyExpenses(
      List<ExpenseFixed> fixed, List<ExpenseVariable> variable) {
    double total = 0;
    for (final expense in fixed) {
      if (expense.frequency.toLowerCase() == 'monthly') {
        total += expense.amount;
      } else if (expense.frequency.toLowerCase() == 'annual') {
        total += expense.amount / 12;
      }
    }
    for (final expense in variable) {
      if (expense.frequency.toLowerCase() == 'monthly') {
        total += expense.amount;
      }
    }
    return total;
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

class _SummaryCard extends StatelessWidget {
  final String title;
  final int value;
  final String description;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(description, style: TextStyle(color: Colors.grey[600])),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              value.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
