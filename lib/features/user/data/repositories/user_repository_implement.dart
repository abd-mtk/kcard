import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/excptions.dart';
import '../../../../app/errors/failures.dart';
import '../../../../app/utils/resources/services/network_info.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repositories.dart';
import '../data sources/local/user_local_data_source.dart';
import '../data sources/remote/user_remot_data_source.dart';
import '../models/user_model.dart';

class UserRepositoryImplement implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImplement({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> addUserInformation(User params) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.addUserInformation(UserModel(
            name: params.name,
            nickname: params.nickname,
            jobtitle: params.jobtitle,
            workingmode: params.workingmode,
            receipt: params.receipt,
            salary: params.salary,
            curranecy: params.curranecy));
        await localDataSource.cacheUser(UserModel(
            name: params.name,
            nickname: params.nickname,
            workingmode: params.workingmode,
            jobtitle: params.jobtitle,
            receipt: params.receipt,
            salary: params.salary,
            curranecy: params.curranecy));
        return Right(params);
      } on NetworkException {
        return Left(SaveNetworkFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteUserInformation(User params) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteUserInformation();
        await localDataSource.deleteUser();
        return const Right(unit);
      } on NetworkException {
        return Left(DeleteNetworkFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, User>> updateUserInformation(User params) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updateUserInformation(UserModel(
            name: params.name,
            nickname: params.nickname,
            workingmode: params.workingmode,
            jobtitle: params.jobtitle,
            receipt: params.receipt,
            salary: params.salary,
            curranecy: params.curranecy));
        await localDataSource.cacheUser(UserModel(
            name: params.name,
            nickname: params.nickname,
            workingmode: params.workingmode,
            jobtitle: params.jobtitle,
            receipt: params.receipt,
            salary: params.salary,
            curranecy: params.curranecy));
        return Right(params);
      } on NetworkException {
        return Left(UpdateNetworkFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, User>> getUserInformation() async {
    if (await networkInfo.isConnected) {
      try {
        final User user = await remoteDataSource.getUserInformation();
        await localDataSource.cacheUser(UserModel(
            name: user.name,
            nickname: user.nickname,
            workingmode: user.workingmode,
            jobtitle: user.jobtitle,
            receipt: user.receipt,
            salary: user.salary,
            curranecy: user.curranecy));
        return Right(user);
      } on NetworkException {
        return Left(GetNetworkFailure());
      }
    } else {
      try {
        final user = await localDataSource.getUser();
        return Right(user);
      } on CacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
