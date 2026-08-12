import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/profile.dart';
import '../providers/sample_data_provider.dart';

class ProfileSwitcherEnhanced extends ConsumerWidget {
  const ProfileSwitcherEnhanced();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProfile = ref.watch(selectedProfileProvider);

    return PopupMenuButton<ProfileType>(
      onSelected: (profile) {
        ref.read(selectedProfileProvider.notifier).state = profile;
      },
      itemBuilder: (context) => ProfileType.values.map((profile) {
        return PopupMenuItem(
          value: profile,
          child: Row(
            children: [
              _getProfileIcon(profile),
              const SizedBox(width: 12),
              Text(_getProfileLabel(profile)),
              if (selectedProfile == profile) ...[
                const SizedBox(width: 8),
                const Icon(Icons.check, size: 16, color: Colors.green),
              ],
            ],
          ),
        );
      }).toList(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _getProfileIcon(selectedProfile),
            const SizedBox(width: 8),
            Text(_getProfileLabel(selectedProfile), style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(width: 4),
            const Icon(Icons.arrow_drop_down, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _getProfileIcon(ProfileType type) {
    final iconData = _getProfileIconData(type);
    final color = _getProfileColor(type);
    return Icon(iconData, size: 20, color: color);
  }

  IconData _getProfileIconData(ProfileType type) {
    switch (type) {
      case ProfileType.individual: return Icons.person;
      case ProfileType.family: return Icons.family_restroom;
      case ProfileType.huf: return Icons.account_balance;
      case ProfileType.business: return Icons.business;
    }
  }

  Color _getProfileColor(ProfileType type) {
    switch (type) {
      case ProfileType.individual: return Colors.blue.shade400;
      case ProfileType.family: return Colors.pink.shade400;
      case ProfileType.huf: return Colors.amber.shade400;
      case ProfileType.business: return Colors.green.shade400;
    }
  }

  String _getProfileLabel(ProfileType type) {
    switch (type) {
      case ProfileType.individual: return 'Rajesh';
      case ProfileType.family: return 'Family';
      case ProfileType.huf: return 'HUF';
      case ProfileType.business: return 'Business';
    }
  }
}
