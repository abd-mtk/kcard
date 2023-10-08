import '../../domain/entities/transaction.dart';

class TransactionModel extends Transaction {
  const TransactionModel(
      {required super.id,
      required super.type,
      required super.recipient,
      required super.title,
      required super.value,
      super.note,
      required super.date});

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      type: json['type'],
      recipient: json['recipient'],
      title: json['title'],
      value: json['value'],
      note: json['note'],
      date: json['date'],
    );
  }

  factory TransactionModel.fromEntity(Transaction transaction) {
    return TransactionModel(
      id: transaction.id,
      type: transaction.type,
      recipient: transaction.recipient,
      title: transaction.title,
      value: transaction.value,
      note: transaction.note,
      date: transaction.date,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': super.id,
      'type': super.type,
      'recipient': super.recipient,
      'title': super.title,
      'value': super.value,
      'note': super.note,
      'date': super.date,
    };
  }

  
}
