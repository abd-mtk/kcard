import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/auth/excptions.dart';
import '../../../../app/errors/auth/failures.dart';
import '../../../../app/utils/resources/network_info.dart';
import '../../domain/entities/auth.dart';
import '../../domain/repositories/auth_repositories.dart';
import '../data sources/local/auth_local_data_source.dart';
import '../data sources/remote/auth_remot_data_source.dart';
import '../models/auth_model.dart';

class AuthRepositoryImplement implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImplement({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<AuthFailure, Auth>> login(Auth auth) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource
            .login(AuthModel(email: auth.email, password: auth.password));
        localDataSource.cacheAuthUser(
            AuthModel(email: auth.email, password: auth.password));
        return Right(auth);
      } on ServerException {
        return Left(AuthServerFailure());
      }
    } else {
      try {
        final authuser = await localDataSource.getAuthUser();
        return Right(authuser);
      } on EmptyCacheException {
        return Left(AuthEmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Auth>> register(Auth auth) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource
            .register(AuthModel(email: auth.email, password: auth.password));
        localDataSource.cacheAuthUser(
            AuthModel(email: auth.email, password: auth.password));
        return Right(auth);
      } on ServerException {
        return Left(AuthServerFailure());
      }
    } else {
      return Left(AuthServerFailure());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.logout();
        await localDataSource.deleteAuthUser();
        return const Right(unit);
      } on ServerException {
        return Left(AuthServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
