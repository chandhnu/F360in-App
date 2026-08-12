import 'package:flutter/material.dart';
import '../../domain/models/profile.dart';

class ProfileSwitcher extends StatefulWidget {
  const ProfileSwitcher();

  @override
  State<ProfileSwitcher> createState() => _ProfileSwitcherState();
}

class _ProfileSwitcherState extends State<ProfileSwitcher> {
  ProfileType? _selectedProfile = ProfileType.individual;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ProfileType>(
      onSelected: (profile) {
        setState(() => _selectedProfile = profile);
      },
      itemBuilder: (context) => [
        const PopupMenuItem(value: ProfileType.individual, child: Row(children: [Icon(Icons.person, size: 20), SizedBox(width: 8), Text('Individual')])),
        const PopupMenuItem(value: ProfileType.family, child: Row(children: [Icon(Icons.family_restroom, size: 20), SizedBox(width: 8), Text('Family')])),
        const PopupMenuItem(value: ProfileType.huf, child: Row(children: [Icon(Icons.account_balance, size: 20), SizedBox(width: 8), Text('HUF')])),
        const PopupMenuItem(value: ProfileType.business, child: Row(children: [Icon(Icons.business, size: 20), SizedBox(width: 8), Text('Business')])),
      ],
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_getProfileIcon(_selectedProfile)),
          const SizedBox(width: 8),
          Text(_getProfileLabel(_selectedProfile)),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  IconData _getProfileIcon(ProfileType? type) {
    switch (type) {
      case ProfileType.individual:
        return Icons.person;
      case ProfileType.family:
        return Icons.family_restroom;
      case ProfileType.huf:
        return Icons.account_balance;
      case ProfileType.business:
        return Icons.business;
      case null:
        return Icons.question_mark;
    }
  }

  String _getProfileLabel(ProfileType? type) {
    switch (type) {
      case ProfileType.individual:
        return 'Individual';
      case ProfileType.family:
        return 'Family';
      case ProfileType.huf:
        return 'HUF';
      case ProfileType.business:
        return 'Business';
      case null:
        return 'Select Profile';
    }
  }
}
