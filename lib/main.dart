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
