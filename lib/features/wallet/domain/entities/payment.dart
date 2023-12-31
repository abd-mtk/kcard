import 'package:equatable/equatable.dart';

class Payment extends Equatable {
  final String? id;
  final String title;
  final double value;
  final String date;
  final String category;
  final String note;

  const Payment({
     this.id,
    required this.title,
    required this.value,
    required this.date,
    required this.category,
    required this.note,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        value,
        date,
        category,
        note,
      ];
}
