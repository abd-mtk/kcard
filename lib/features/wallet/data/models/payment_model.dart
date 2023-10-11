import '../../domain/entities/payment.dart';

class PaymentModel extends Payment {
  const PaymentModel(
      {super.id,
      required super.title,
      required super.value,
      required super.date,
      required super.category,
      required super.note});

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
      id: json['id'],
      title: json['title'],
      value: json['value'],
      date: json['date'],
      category: json['category'],
      note: json['note']);

  factory PaymentModel.fromEntity(Payment payment) => PaymentModel(
      id: payment.id,
      title: payment.title,
      value: payment.value,
      date: payment.date,
      category: payment.category,
      note: payment.note);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'value': value,
        'date': date,
        'category': category,
        'note': note
      };
}
