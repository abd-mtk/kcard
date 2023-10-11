import '../../domain/entities/dashboard.dart';

class DashboardModel extends Dashboard {
  DashboardModel(
      {required super.budget,
      required super.payment,
      required super.transaction});

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      budget: json['budget'],
      payment: json['payment'],
      transaction: json['transaction'],
    );
  }
  factory DashboardModel.fromEntity(Dashboard dashboard) {
    return DashboardModel(
      budget: dashboard.budget,
      payment: dashboard.payment,
      transaction: dashboard.transaction,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'budget': super.budget,
      'payment': super.payment,
      'transaction': super.transaction,
    };
  }
}
