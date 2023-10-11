import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../entities/dashboard.dart';

abstract class DashboardRepository {
  Future<Either<Failure, Dashboard>> getDashboard();
}
