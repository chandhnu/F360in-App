import 'package:flutter/material.dart';
import '../../../utils/currency_formatter.dart';

class AssetAllocationCard extends StatelessWidget {
  final Map<String, dynamic> allocation;
  const AssetAllocationCard({required this.allocation, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Asset Allocation', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: SizedBox(height: 160, child: CustomPaint(painter: PieChartPainter(allocation)))),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: allocation.entries.map((entry) {
                      final key = entry.key;
                      final value = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(width: 12, height: 12, decoration: BoxDecoration(color: Color(value['color']), borderRadius: BorderRadius.circular(2))),
                                const SizedBox(width: 8),
                                Text(key, style: const TextStyle(fontSize: 12)),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text('${value['percentage']}% • ${CurrencyFormatter.formatCompact(value['value'])}', style: const TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final Map<String, dynamic> allocation;
  PieChartPainter(this.allocation);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    var startAngle = -3.14159 / 2;

    allocation.forEach((key, value) {
      final slicePercentage = value['percentage'] / 100;
      final sweepAngle = 2 * 3.14159 * slicePercentage;
      final paint = Paint()..color = Color(value['color'])..style = PaintingStyle.fill;
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, sweepAngle, true, paint);
      startAngle += sweepAngle;
    });
  }

  @override
  bool shouldRepaint(PieChartPainter oldDelegate) => false;
}
