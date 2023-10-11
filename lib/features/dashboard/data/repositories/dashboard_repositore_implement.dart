import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../../../../app/utils/resources/services/network_info.dart';
import '../../domain/entities/dashboard.dart';
import '../../domain/repositories/dashboard_repositories.dart';
import '../data sources/local/dashboard_local_data_source.dart';
import '../data sources/remote/dashboard_remote_data_source.dart';
import '../models/dashboard_model.dart';

class DashboardRepositoreImplement implements DashboardRepository {
  final NetworkInfo networkInfo;
  final DashboardLocalDataSource localDataSource;
  final DashboardRemoteDataSource remoteDataSource;

  DashboardRepositoreImplement({
    required this.networkInfo,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Dashboard>> getDashboard() async {
    if (await networkInfo.isConnected) {
      try {
        final Dashboard dashboard = await remoteDataSource.getDashboard();
        await localDataSource
            .cacheDashboard(DashboardModel.fromEntity(dashboard));
        return Right(dashboard);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        return Left(NetworkFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }
}
