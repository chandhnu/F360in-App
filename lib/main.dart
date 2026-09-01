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
            // Premium Hero Header
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: surfaceColor,
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
              child: Column(
                children: [
                  // Logo with subtle shadow
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          primaryColor,
                          primaryColor.withOpacity(0.85),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.25),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'F360in',
                        style: TextStyle(
                          color: Color(0xFFFFF9F3),
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Main title
                  const Text(
                    'Personal Wealth Operating System',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  // Subtitle
                  Text(
                    'Real-time financial insights at your fingertips',
                    style: TextStyle(
                      color: mutedColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Tagline with accent
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: accentColor.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      'FOCUS. FULL CIRCLE. FUTURE',
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Main Content
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // KPI Section Header
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Wealth Overview',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 60,
                          height: 4,
                          decoration: BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // KPI Cards Grid
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 0.95,
                    children: [
                      _PremiumKPICard(
                        title: 'Net Worth',
                        value: '₹5.0Cr',
                        subtitle: 'Total Assets',
                        color: primaryColor,
                        icon: '💰',
                      ),
                      _PremiumKPICard(
                        title: 'Monthly Income',
                        value: '₹169,170',
                        subtitle: 'Average Monthly',
                        color: secondaryColor,
                        icon: '📈',
                      ),
                      _PremiumKPICard(
                        title: 'Monthly Expense',
                        value: '₹120,000',
                        subtitle: 'Total Outflow',
                        color: accentColor,
                        icon: '💸',
                      ),
                      _PremiumKPICard(
                        title: 'Monthly Surplus',
                        value: '₹49,170',
                        subtitle: 'Available to Save',
                        color: positiveColor,
                        icon: '✨',
                      ),
                    ],
                  ),

                  const SizedBox(height: 56),

                  // Status Section Header
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dashboard Status',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 60,
                          height: 4,
                          decoration: BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Status Container
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: surfaceColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: borderColor,
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.06),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _StatusItem(
                          icon: '✓',
                          text: 'Dashboard UI working perfectly',
                          color: positiveColor,
                        ),
                        const SizedBox(height: 16),
                        _StatusItem(
                          icon: '✓',
                          text: 'Displaying all financial metrics',
                          color: positiveColor,
                        ),
                        const SizedBox(height: 16),
                        _StatusItem(
                          icon: '✓',
                          text: 'Ready for Excel integration',
                          color: positiveColor,
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: secondaryColor.withOpacity(0.08),
                            border: Border.all(
                              color: secondaryColor.withOpacity(0.2),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'Next Phase: Integrate live Excel data reader & advanced analytics',
                            style: TextStyle(
                              color: secondaryColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 56),

                  // Footer
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 1,
                          color: borderColor,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'F360in v1.0.0',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Personal Wealth Operating System',
                          style: TextStyle(
                            color: mutedColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PremiumKPICard extends StatefulWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color color;
  final String icon;

  const _PremiumKPICard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
    required this.icon,
  });

  @override
  State<_PremiumKPICard> createState() => _PremiumKPICardState();
}

class _PremiumKPICardState extends State<_PremiumKPICard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF9F3),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFE5D8CC),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.color.withOpacity(_isHovered ? 0.15 : 0.08),
              blurRadius: _isHovered ? 24 : 16,
              offset: Offset(0, _isHovered ? 8 : 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top section with icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
