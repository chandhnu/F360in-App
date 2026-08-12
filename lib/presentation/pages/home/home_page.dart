import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/profile_switcher_enhanced.dart';
import '../../widgets/cards/net_worth_card.dart';
import '../../widgets/cards/asset_allocation_card.dart';
import '../../widgets/cards/cash_flow_card.dart';
import '../../widgets/cards/recent_transactions_card.dart';
import '../../widgets/cards/goals_card.dart';
import '../../widgets/cards/top_holdings_card.dart';
import '../../providers/sample_data_provider.dart';
import '../../../utils/currency_formatter.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage();

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(sampleFinancialDataProvider);
    final allocation = ref.watch(sampleAssetAllocationProvider);
    final transactions = ref.watch(sampleTransactionsProvider);
    final goals = ref.watch(sampleGoalsProvider);
    final holdings = ref.watch(sampleHoldingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const ProfileSwitcherEnhanced(),
        actions: [IconButton(icon: const Icon(Icons.settings), onPressed: () => Navigator.pushNamed(context, '/settings'))],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _animatedCard(0, NetWorthCard(netWorth: data['netWorth'], trend: data['netWorthTrend'], profileName: data['displayName'])),
              const SizedBox(height: 16),
              _animatedCard(1, SizedBox(child: Row(children: [
                Expanded(child: _StatCard(label: 'Assets', value: data['assets'], color: Colors.green)),
                const SizedBox(width: 12),
                Expanded(child: _StatCard(label: 'Liabilities', value: data['liabilities'], color: Colors.red)),
              ]))),
              const SizedBox(height: 16),
              _animatedCard(2, AssetAllocationCard(allocation: allocation)),
              const SizedBox(height: 16),
              _animatedCard(3, CashFlowCard(income: data['monthlyIncome'], expenses: data['monthlyExpenses'])),
              const SizedBox(height: 16),
              _animatedCard(4, RecentTransactionsCard(transactions: transactions)),
              const SizedBox(height: 16),
              _animatedCard(5, TopHoldingsCard(holdings: holdings)),
              const SizedBox(height: 16),
              _animatedCard(6, GoalsCard(goals: goals)),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _animatedCard(int index, Widget child) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) {
        final delay = index * 0.08;
        final animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _animationController, curve: Interval(delay, delay + 0.6, curve: Curves.easeOut)));
        return Transform.translate(offset: Offset(0, 20 * (1 - animation.value)), child: Opacity(opacity: animation.value, child: child));
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final double value;
  final Color color;

  const _StatCard({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(width: 8, height: 8, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
                const SizedBox(width: 8),
                Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 12),
            Text(CurrencyFormatter.format(value), style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}
