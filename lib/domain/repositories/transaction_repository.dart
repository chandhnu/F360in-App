import '../models/transaction.dart';

abstract class TransactionRepository {
  Future<Transaction> createTransaction(Transaction transaction);
  Future<Transaction?> getTransaction(String transactionId);
  Future<List<Transaction>> getTransactionsForProfile(String profileId, {DateTime? startDate, DateTime? endDate});
  Future<void> updateTransaction(Transaction transaction);
  Future<void> deleteTransaction(String transactionId);
}
