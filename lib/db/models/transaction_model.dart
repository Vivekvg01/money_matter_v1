import 'package:hive/hive.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 1)
enum CategoryType {
  
  @HiveField(0)
  income,

  @HiveField(1)
  expense,
}

@HiveType(typeId: 2)
class TransactionModel {
  @HiveField(0)
  final int amount;

  @HiveField(1)
  final DateTime date;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final CategoryType type;

  TransactionModel(
    this.amount,
    this.date,
    this.category,
    this.type,
  );
}
