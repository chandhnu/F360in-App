import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import '../models/excel_models.dart';

class ExcelReader {
  static Future<void> readExcelFile() async {
    try {
      // Load Excel file from assets
      ByteData data = await rootBundle.load('assets/F360in_Excel_Template.xlsx');
      var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      var excel = Excel.decodeBytes(bytes);
      
      print('✅ Excel file loaded successfully');
      print('📋 Sheets found: ${excel.tables.keys.toList()}');
      
      // Read META sheet
      var metaSheet = excel.tables['META'];
      if (metaSheet != null) {
        print('\n📊 META Sheet:');
        for (var row in metaSheet.rows) {
          if (row.isNotEmpty) {
            print('${row[0]?.value} = ${row[1]?.value}');
          }
        }
      }
      
      // Count sheets
      var equitySheet = excel.tables['EQUITY_SHARES'];
      print('\n📈 EQUITY_SHARES: ${(equitySheet?.rows.length ?? 0) - 1} stocks');
      
      var mfSheet = excel.tables['MUTUAL_FUNDS'];
      print('💰 MUTUAL_FUNDS: ${(mfSheet?.rows.length ?? 0) - 1} funds');
      
      var incomeSheet = excel.tables['INCOME'];
      print('💵 INCOME: ${(incomeSheet?.rows.length ?? 0) - 1} line items');
      
      var expFixedSheet = excel.tables['EXPENSES_FIXED'];
      print('📉 EXPENSES_FIXED: ${(expFixedSheet?.rows.length ?? 0) - 1} items');
      
      print('\n✅ All sheets read successfully!');
      
    } catch (e) {
      print('❌ Error reading Excel: $e');
    }
  }
}
