import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../presentation/pages/home/home_page.dart';
import '../presentation/pages/accounts/accounts_page.dart';
import '../presentation/pages/transactions/transactions_page.dart';
import '../presentation/pages/investments/investments_page.dart';
import '../presentation/pages/reports/reports_page.dart';
import '../presentation/pages/goals/goals_page.dart';
import '../presentation/pages/settings/settings_page.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', name: 'home', builder: (context, state) => const HomePage()),
      GoRoute(path: '/accounts', name: 'accounts', builder: (context, state) => const AccountsPage()),
      GoRoute(path: '/transactions', name: 'transactions', builder: (context, state) => const TransactionsPage()),
      GoRoute(path: '/investments', name: 'investments', builder: (context, state) => const InvestmentsPage()),
      GoRoute(path: '/reports', name: 'reports', builder: (context, state) => const ReportsPage()),
      GoRoute(path: '/goals', name: 'goals', builder: (context, state) => const GoalsPage()),
      GoRoute(path: '/settings', name: 'settings', builder: (context, state) => const SettingsPage()),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(child: Text('Page not found: ${state.uri}')),
    ),
  );
});
