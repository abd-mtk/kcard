import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String id;
  final String type;
  final String recipient;
  final String title;
  final double value;
  final String? note;
  final String date;

  const Transaction({
    required this.id,
    required this.type,
    required this.recipient,
    required this.title,
    required this.value,
    this.note,
    required this.date,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        recipient,
        title,
        value,
        note,
        date,
      ];
}
