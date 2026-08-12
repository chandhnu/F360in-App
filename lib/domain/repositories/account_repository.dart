import '../models/account.dart';

abstract class AccountRepository {
  Future<Account> createAccount(Account account);
  Future<Account?> getAccount(String accountId);
  Future<List<Account>> getAccountsForProfile(String profileId);
  Future<void> updateAccount(Account account);
  Future<void> deleteAccount(String accountId);
}
