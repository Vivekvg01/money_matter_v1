import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:money_matter/db/models/transaction_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

ValueNotifier<List<TransactionModel>> transactionListNotifier =
    ValueNotifier([]);

const String dbName = 'transaction_db';

Future<void> addTransactions(TransactionModel value) async {
  final transactionDb = await Hive.openBox<TransactionModel>(dbName);
  await transactionDb.add(value);
  transactionListNotifier.value.add(value);
  transactionListNotifier.notifyListeners();
}

Future<void> getAllTransactions() async {
  final transactionDb = await Hive.openBox<TransactionModel>(dbName);
  transactionListNotifier.value.clear();
  transactionListNotifier.value.addAll(transactionDb.values);
  transactionListNotifier.notifyListeners();
}

Future<void> deleteTransaction(index) async {
  final transactionDb = await Hive.openBox<TransactionModel>(dbName);
  transactionDb.deleteAt(index);
  getAllTransactions();
}

Future<void> updateTransaction(TransactionModel value, int index) async {
  final transactionDb = await Hive.openBox<TransactionModel>(dbName);
  transactionDb.putAt(index, value);
  getAllTransactions();
}

Future<void> resetDB() async {
  final transactionDb = await Hive.openBox<TransactionModel>(dbName);
  transactionDb.clear();
}

Future<void> resetSharedPrefs() async {
  final sharedPref = await SharedPreferences.getInstance();
  sharedPref.clear();
}
