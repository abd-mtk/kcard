import '../../domain/entities/expenses.dart';

class ExpensesModel extends Expenses {
  const ExpensesModel(
      {super.id,
      required super.name,
      required super.amount,
      required super.date,
      required super.category,
      required super.note});

  factory ExpensesModel.fromJson(Map<String, dynamic> json) => ExpensesModel(
      id: json['id'],
      name: json['name'],
      amount: json['amount'],
      date: json['date'],
      category: json['category'],
      note: json['note']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'amount': amount,
        'date': date,
        'category': category,
        'note': note
      };
}
