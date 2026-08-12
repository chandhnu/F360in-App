import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/profile.dart';
import '../models/sample_data.dart';

final sampleFinancialDataProvider = StateProvider((ref) => SampleFinancialData.individualProfile);
final sampleAssetAllocationProvider = StateProvider((ref) => SampleFinancialData.assetAllocation);
final sampleTransactionsProvider = StateProvider((ref) => SampleFinancialData.recentTransactions);
final sampleGoalsProvider = StateProvider((ref) => SampleFinancialData.goals);
final sampleHoldingsProvider = StateProvider((ref) => SampleFinancialData.topHoldings);
final wealthTrendProvider = StateProvider((ref) => SampleFinancialData.wealthTrend);
final selectedProfileProvider = StateProvider<ProfileType>((ref) => ProfileType.individual);
