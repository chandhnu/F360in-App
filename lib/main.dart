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
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4A4A2F),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8EBDF),
        fontFamily: 'Roboto',
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Brand Colors
    const primaryColor = Color(0xFF4A4A2F);
    const secondaryColor = Color(0xFF08695C);
    const accentColor = Color(0xFFB8893D);
    const backgroundColor = Color(0xFFF8EBDF);
    const surfaceColor = Color(0xFFFFF9F3);
    const textColor = Color(0xFF292929);
    const mutedColor = Color(0xFF756F68);
    const borderColor = Color(0xFFE5D8CC);
    const positiveColor = Color(0xFF2F7D5C);

    // Sample data
    const netWorth = 50000000.0;
    const monthlyIncome = 169170.0;
    const monthlyExpense = 120000.0;
    const monthlySurplus = monthlyIncome - monthlyExpense;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Premium Header with Logo
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: surfaceColor,
                border: Border(
                  bottom: BorderSide(color: borderColor, width: 1),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              child: Column(
                children: [
                  // Logo Placeholder (centered)
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'F360in',
                        style: TextStyle(
                          color: Color(0xFFFFF9F3),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Personal Wealth Operating System',
                    style: TextStyle(
                      color: mutedColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'FOCUS. FULL CIRCLE. FUTURE',
                    style: TextStyle(
                      color: accentColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),

            // Main Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // KPI Cards Grid
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _KPICard(
                        title: 'Net Worth',
                        value: '₹5.0Cr',
                        subtitle: 'Total Assets',
                        color: primaryColor,
                        surfaceColor: surfaceColor,
                      ),
                      _KPICard(
                        title: 'Monthly Income',
                        value: '₹169,170',
                        subtitle: 'Average Monthly',
                        color: secondaryColor,
                        surfaceColor: surfaceColor,
                      ),
                      _KPICard(
                        title: 'Monthly Expense',
                        value: '₹120,000',
                        subtitle: 'Total Outflow',
                        color: accentColor,
                        surfaceColor: surfaceColor,
                      ),
                      _KPICard(
                        title: 'Monthly Surplus',
                        value: '₹49,170',
                        subtitle: 'Available to Save',
                        color: positiveColor,
                        surfaceColor: surfaceColor,
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Dashboard Status Section
                  Text(
                    'Status',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 16),

                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: surfaceColor,
                      border: Border.all(color: borderColor, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _StatusItem(
                          icon: '✓',
                          text: 'Dashboard UI working',
                          color: positiveColor,
                        ),
                        const SizedBox(height: 12),
                        _StatusItem(
                          icon: '✓',
                          text: 'Displaying financial metrics',
                          color: positiveColor,
                        ),
                        const SizedBox(height: 12),
                        _StatusItem(
                          icon: '✓',
                          text: 'Ready for Excel integration',
                          color: positiveColor,
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F5F3),
                            border: Border.all(
                              color: secondaryColor.withOpacity(0.2),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'Next: Integrate live Excel data reader',
                            style: TextStyle(
                              color: secondaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Footer
                  Center(
                    child: Text(
                      'F360in v1.0.0 • Personal Wealth OS',
                      style: TextStyle(
                        color: mutedColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
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
  final String subtitle;
  final Color color;
  final Color surfaceColor;

  const _KPICard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
    required this.surfaceColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: surfaceColor,
        border: Border.all(
          color: const Color(0xFFE5D8CC),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF756F68),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: color,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Color(0xFF756F68),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusItem extends StatelessWidget {
  final String icon;
  final String text;
  final Color color;

  const _StatusItem({
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          icon,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF292929),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
