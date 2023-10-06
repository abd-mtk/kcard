import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/user/excptions.dart';
import '../../../../app/errors/user/failures.dart';
import '../../../../app/utils/resources/network_info.dart';
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
  Future<Either<UserFailure, User>> addUserInformation(User params) async {
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
      } on AddUserInformationException {
        return Left(AddUserInfoFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<UserFailure, Unit>> deleteUserInformation(User params) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteUserInformation();
        await localDataSource.deleteUser();
        return const Right(unit);
      } on DeleteUserInformationException {
        return Left(DeleteUserInfoFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<UserFailure, User>> updateUserInformation(User params) async {
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
      } on UpdateUserInformationException {
        return Left(UpdateUserInfoFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<UserFailure, User>> getUserInformation() async {
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
      } on UserNotFoundException {
        return Left(GetUserInformationFailure());
      }
    } else {
      try {
        final user = await localDataSource.getUser();
        return Right(user);
      } on CacheUserException {
        return Left(GetUserInformationFailure());
      }
    }
  }
}
