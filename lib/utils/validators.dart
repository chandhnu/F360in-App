class Validators {
  static String? validateDisplayName(String? value) {
    if (value == null || value.isEmpty) return 'Name cannot be empty';
    if (value.length > 100) return 'Name too long (max 100 characters)';
    return null;
  }

  static String? validateAmount(String? value) {
    if (value == null || value.isEmpty) return 'Amount required';
    try {
      final amount = double.parse(value);
      if (amount <= 0) return 'Amount must be positive';
    } catch (e) {
      return 'Invalid amount';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email required';
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) return 'Invalid email';
    return null;
  }
}
