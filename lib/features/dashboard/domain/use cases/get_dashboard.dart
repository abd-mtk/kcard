import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../entities/dashboard.dart';
import '../repositories/dashboard_repositories.dart';

class GetDashboardUseCase {
  final DashboardRepository repository;

  GetDashboardUseCase(this.repository);

  Future<Either<Failure, Dashboard>> call() async {
    return await repository.getDashboard();
  }
}
