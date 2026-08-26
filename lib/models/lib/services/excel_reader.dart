class MetaData {
  String name;
  String currency;
  int fyStartMonth;
  String updateDate;
  
  MetaData({
    required this.name,
    required this.currency,
    required this.fyStartMonth,
    required this.updateDate,
  });
}

class Asset {
  String assetId;
  String category;
  String item;
  double quantity;
  double purchasePrice;
  String purchaseDate;
  double currentValue;
  
  Asset({
    required this.assetId,
    required this.category,
    required this.item,
    required this.quantity,
    required this.purchasePrice,
    required this.purchaseDate,
    required this.currentValue,
  });
}

class SavingsMaturity {
  String savingsId;
  String category;
  String item;
  double amount;
  String purchaseDate;
  String maturityDate;
  double maturityValue;
  
  SavingsMaturity({
    required this.savingsId,
    required this.category,
    required this.item,
    required this.amount,
    required this.purchaseDate,
    required this.maturityDate,
    required this.maturityValue,
  });
}

class EquityShare {
  String stockId;
  String symbol;
  String companyName;
  String exchange;
  double quantity;
  double purchasePrice;
  String purchaseDate;
  
  EquityShare({
    required this.stockId,
    required this.symbol,
    required this.companyName,
    required this.exchange,
    required this.quantity,
    required this.purchasePrice,
    required this.purchaseDate,
  });
}

class EquityUS {
  String stockId;
  String symbol;
  String companyName;
  String exchange;
  double quantity;
  double purchasePriceUSD;
  String purchaseDate;
  double purchaseExchangeRate;
  
  EquityUS({
    required this.stockId,
    required this.symbol,
    required this.companyName,
    required this.exchange,
    required this.quantity,
    required this.purchasePriceUSD,
    required this.purchaseDate,
    required this.purchaseExchangeRate,
  });
}

class Crypto {
  String cryptoId;
  String symbol;
  String assetName;
  double quantity;
  double purchasePriceINR;
  String purchaseDate;
  String storageLocation;
  
  Crypto({
    required this.cryptoId,
    required this.symbol,
    required this.assetName,
    required this.quantity,
    required this.purchasePriceINR,
    required this.purchaseDate,
    required this.storageLocation,
  });
}

class MutualFund {
  String mfId;
  String schemeName;
  String fundType;
  String fundHouse;
  String plan;
  String investmentType;
  double? units;
  double? purchaseNavPrice;
  String? purchaseDate;
  double? sipMonthlyAmount;
  String? sipStartDate;
  String? sipEndDate;
  
  MutualFund({
    required this.mfId,
    required this.schemeName,
    required this.fundType,
    required this.fundHouse,
    required this.plan,
    required this.investmentType,
    this.units,
    this.purchaseNavPrice,
    this.purchaseDate,
    this.sipMonthlyAmount,
    this.sipStartDate,
    this.sipEndDate,
  });
}

class Liability {
  String liabilityId;
  String category;
  String item;
  double amount;
  double interestRate;
  double emi;
  String startDate;
  String endDate;
  
  Liability({
    required this.liabilityId,
    required this.category,
    required this.item,
    required this.amount,
    required this.interestRate,
    required this.emi,
    required this.startDate,
    required this.endDate,
  });
}

class Income {
  String incomeId;
  String category;
  String item;
  String frequency;
  double amount;
  String regime;
  String? section;
  bool taxable;
  String notes;
  
  Income({
    required this.incomeId,
    required this.category,
    required this.item,
    required this.frequency,
    required this.amount,
    required this.regime,
    this.section,
    required this.taxable,
    required this.notes,
  });
}

class ExpenseFixed {
  String expenseId;
  String category;
  String item;
  String frequency;
  double amount;
  String notes;
  
  ExpenseFixed({
    required this.expenseId,
    required this.category,
    required this.item,
    required this.frequency,
    required this.amount,
    required this.notes,
  });
}

class ExpenseVariable {
  String expenseId;
  String category;
  String item;
  String frequency;
  double amount;
  String notes;
  
  ExpenseVariable({
    required this.expenseId,
    required this.category,
    required this.item,
    required this.frequency,
    required this.amount,
    required this.notes,
  });
}

class Goal {
  String goalId;
  String goalName;
  double targetAmount;
  double currentAmount;
  String targetDate;
  double monthlyContribution;
  double expectedReturn;
  String notes;
  String status;
  
  Goal({
    required this.goalId,
    required this.goalName,
    required this.targetAmount,
    required this.currentAmount,
    required this.targetDate,
    required this.monthlyContribution,
    required this.expectedReturn,
    required this.notes,
    required this.status,
  });
}
