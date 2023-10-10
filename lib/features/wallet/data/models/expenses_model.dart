import '../../domain/entities/expenses.dart';

class ExpensesModel extends Expenses {
  const ExpensesModel(
      {super.id,
      required super.title,
      required super.value,
      required super.date,
      required super.category,
      required super.note});

  factory ExpensesModel.fromJson(Map<String, dynamic> json) => ExpensesModel(
      id: json['id'],
      title: json['title'],
      value: json['value'],
      date: json['date'],
      category: json['category'],
      note: json['note']);

  factory ExpensesModel.fromEntity(Expenses expenses) => ExpensesModel(
      id: expenses.id,
      title: expenses.title,
      value: expenses.value,
      date: expenses.date,
      category: expenses.category,
      note: expenses.note);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'value': value,
        'date': date,
        'category': category,
        'note': note
      };
}
