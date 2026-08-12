import '../models/holding.dart';

abstract class HoldingRepository {
  Future<Holding> createHolding(Holding holding);
  Future<Holding?> getHolding(String holdingId);
  Future<List<Holding>> getHoldingsForAccount(String accountId);
  Future<List<Holding>> getHoldingsForProfile(String profileId);
  Future<void> updateHolding(Holding holding);
  Future<void> deleteHolding(String holdingId);
}
