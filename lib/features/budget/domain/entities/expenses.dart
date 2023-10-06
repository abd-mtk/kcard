import 'package:equatable/equatable.dart';

class Expenses extends Equatable {
  final String? id;
  final String name;
  final double amount;
  final String date;
  final String category;
  final String note;

  const Expenses({
     this.id,
    required this.name,
    required this.amount,
    required this.date,
    required this.category,
    required this.note,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        amount,
        date,
        category,
        note,
      ];
}
