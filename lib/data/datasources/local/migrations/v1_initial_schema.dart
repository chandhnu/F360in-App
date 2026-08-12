import 'package:sqflite/sqflite.dart';

class V1InitialSchema {
  static Future<void> create(Database db) async {
    await db.execute('''CREATE TABLE users (
        user_id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        created_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        is_deleted INTEGER DEFAULT 0
      )''');

    await db.execute('''CREATE TABLE profiles (
        profile_id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        profile_type TEXT NOT NULL,
        legal_name TEXT NOT NULL,
        display_name TEXT NOT NULL,
        created_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        tax_identifier TEXT,
        fiscal_year_start TEXT DEFAULT '04-01',
        base_currency TEXT DEFAULT 'INR',
        is_active INTEGER DEFAULT 1,
        is_deleted INTEGER DEFAULT 0,
        FOREIGN KEY (user_id) REFERENCES users(user_id),
        UNIQUE(user_id, display_name)
      )''');

    await db.execute('''CREATE TABLE accounts (
        account_id TEXT PRIMARY KEY,
        profile_id TEXT NOT NULL,
        account_type TEXT NOT NULL,
        account_name TEXT NOT NULL,
        account_number TEXT,
        currency TEXT DEFAULT 'INR',
        institution TEXT,
        opened_date DATE NOT NULL,
        closed_date DATE,
        is_active INTEGER DEFAULT 1,
        is_reconciled INTEGER DEFAULT 0,
        created_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        is_deleted INTEGER DEFAULT 0,
        FOREIGN KEY (profile_id) REFERENCES profiles(profile_id)
      )''');

    await db.execute('''CREATE TABLE transactions (
        transaction_id TEXT PRIMARY KEY,
        profile_id TEXT NOT NULL,
        transaction_type TEXT NOT NULL,
        effective_date DATE NOT NULL,
        recorded_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        description TEXT NOT NULL,
        amount REAL NOT NULL,
        currency TEXT DEFAULT 'INR',
        source_id TEXT DEFAULT 'MANUAL',
        source_account_id TEXT NOT NULL,
        dest_account_id TEXT,
        notes TEXT,
        is_reconciled INTEGER DEFAULT 0,
        is_deleted INTEGER DEFAULT 0,
        created_timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (profile_id) REFERENCES profiles(profile_id),
        FOREIGN KEY (source_account_id) REFERENCES accounts(account_id)
      )''');

    await db.execute('''CREATE TABLE holdings (
        holding_id TEXT PRIMARY KEY,
        account_id TEXT NOT NULL,
        asset_id TEXT NOT NULL,
        asset_name TEXT NOT NULL,
        asset_class TEXT NOT NULL,
        quantity REAL NOT NULL,
        cost_basis_per_unit REAL NOT NULL,
        current_price_per_unit REAL NOT NULL,
        acquisition_date DATE NOT NULL,
        last_price_update DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        is_active INTEGER DEFAULT 1,
        is_deleted INTEGER DEFAULT 0,
        FOREIGN KEY (account_id) REFERENCES accounts(account_id),
        UNIQUE(account_id, asset_id)
      )''');

    await db.execute('''CREATE TABLE valuations (
        valuation_id TEXT PRIMARY KEY,
        profile_id TEXT NOT NULL,
        asset_id TEXT NOT NULL,
        valuation_date DATE NOT NULL,
        price_per_unit REAL NOT NULL,
        source TEXT DEFAULT 'MANUAL',
        last_updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        is_deleted INTEGER DEFAULT 0,
        FOREIGN KEY (profile_id) REFERENCES profiles(profile_id),
        UNIQUE(asset_id, valuation_date)
      )''');

    await db.execute('''CREATE TABLE goals (
        goal_id TEXT PRIMARY KEY,
        profile_id TEXT NOT NULL,
        goal_name TEXT NOT NULL,
        goal_type TEXT NOT NULL,
        target_amount REAL NOT NULL,
        target_date DATE NOT NULL,
        priority TEXT,
        created_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        is_active INTEGER DEFAULT 1,
        is_deleted INTEGER DEFAULT 0,
        FOREIGN KEY (profile_id) REFERENCES profiles(profile_id)
      )''');

    await db.execute('CREATE INDEX idx_users_email ON users(email)');
    await db.execute('CREATE INDEX idx_profiles_user_type ON profiles(user_id, profile_type)');
    await db.execute('CREATE INDEX idx_accounts_profile ON accounts(profile_id)');
    await db.execute('CREATE INDEX idx_transactions_profile ON transactions(profile_id)');
    await db.execute('CREATE INDEX idx_transactions_date ON transactions(effective_date)');
    await db.execute('CREATE INDEX idx_holdings_account ON holdings(account_id)');
  }
}
