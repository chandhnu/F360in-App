import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('F360in', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            const Text('Personal Wealth Operating System'),
            const SizedBox(height: 16),
            const Text('Version: 1.0.0 (Dashboard Prototype)', style: TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 8),
            const Text('This is a high-fidelity UI prototype with sample data for design review.', style: TextStyle(fontSize: 11, color: Colors.grey)),
          ]))),
          const SizedBox(height: 24),
          Text('Prototype Features', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 8),
          Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const _SettingItem(icon: Icons.dashboard, title: 'Dashboard', subtitle: 'Premium wealth overview with key metrics'),
            const Divider(height: 24),
            const _SettingItem(icon: Icons.person_outline, title: 'Profile Switching', subtitle: 'Individual, Family, HUF, Business'),
            const Divider(height: 24),
            const _SettingItem(icon: Icons.pie_chart, title: 'Asset Allocation', subtitle: 'Visual portfolio breakdown'),
            const Divider(height: 24),
            const _SettingItem(icon: Icons.trending_up, title: 'Holdings & XIRR', subtitle: 'Investment performance tracking'),
            const Divider(height: 24),
            const _SettingItem(icon: Icons.flag_outlined, title: 'Goals Tracking', subtitle: 'Financial objectives with progress'),
          ]))),
          const SizedBox(height: 24),
          Text('Notes', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 8),
          Card(color: Colors.amber.shade900.withOpacity(0.2), child: const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('This is a UI prototype only.', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('• All data is sample/hardcoded\n• No database integration yet\n• No calculations or business logic\n• For design review only\n• Full financial engine coming in Milestone 2+', style: TextStyle(fontSize: 12)),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _SettingItem({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 24),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }
}
