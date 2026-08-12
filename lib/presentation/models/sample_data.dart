import '../../domain/models/profile.dart';

class SampleFinancialData {
  static const Map<String, dynamic> individualProfile = {
    'profileId': 'prof_001',
    'displayName': 'Rajesh',
    'profileType': ProfileType.individual,
    'netWorth': 7550000,
    'netWorthTrend': 8.5,
    'assets': 10150000,
    'liabilities': 2600000,
    'monthlyIncome': 250000,
    'monthlyExpenses': 85000,
    'monthlyNetCashFlow': 165000,
  };

  static const Map<String, dynamic> assetAllocation = {
    'EQUITY': {'percentage': 28, 'value': 2840000, 'color': 0xFF2196F3},
    'DEBT': {'percentage': 32, 'value': 3248000, 'color': 0xFF4CAF50},
    'CASH': {'percentage': 18, 'value': 1827000, 'color': 0xFFFF9800},
    'REAL_ESTATE': {'percentage': 22, 'value': 2235000, 'color': 0xFF9C27B0},
  };

  static const List<Map<String, dynamic>> recentTransactions = [
    {'date': '08 Aug 2026', 'description': 'Salary Deposit', 'amount': 250000, 'type': 'INCOME', 'account': 'HDFC Salary'},
    {'date': '07 Aug 2026', 'description': 'Mutual Fund SIP', 'amount': 50000, 'type': 'INVESTMENT', 'account': 'Groww App'},
    {'date': '05 Aug 2026', 'description': 'Groceries & Shopping', 'amount': 8500, 'type': 'EXPENSE', 'account': 'HDFC Savings'},
    {'date': '02 Aug 2026', 'description': 'Home Loan EMI', 'amount': 67000, 'type': 'LIABILITY', 'account': 'ICICI Home Loan'},
  ];

  static const List<Map<String, dynamic>> goals = [
    {'goalName': 'Retirement', 'targetAmount': 5000000, 'currentAmount': 3250000, 'targetDate': 'Dec 2045', 'progress': 65, 'priority': 'HIGH'},
    {'goalName': 'Child Education', 'targetAmount': 2000000, 'currentAmount': 950000, 'targetDate': 'Aug 2033', 'progress': 48, 'priority': 'HIGH'},
    {'goalName': 'Vacation Fund', 'targetAmount': 500000, 'currentAmount': 350000, 'targetDate': 'Dec 2026', 'progress': 70, 'priority': 'MEDIUM'},
  ];

  static const Map<String, dynamic> topHoldings = {
    'holdings': [
      {'name': 'Infosys Limited', 'type': 'EQUITY', 'quantity': '150 shares', 'value': 2145000, 'xirr': 12.5, 'change': 2.3},
      {'name': 'Axis Bluechip Fund', 'type': 'MUTUAL_FUND', 'quantity': '8,500 units', 'value': 1062500, 'xirr': 9.8, 'change': 1.8},
      {'name': 'ICICI Bank', 'type': 'EQUITY', 'quantity': '200 shares', 'value': 632000, 'xirr': 8.2, 'change': -0.5},
    ],
  };

  static const List<double> wealthTrend = [6850000, 6920000, 7050000, 7180000, 7320000, 7450000, 7550000];
  static const List<String> trendLabels = ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug'];
}
