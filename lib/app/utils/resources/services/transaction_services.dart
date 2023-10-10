// import '../../../../features/transaction/data/data sources/local/trnsaction_local_data_source.dart.dart';
// import '../../../../features/transaction/data/data sources/remote/transaction_remote_data_source.dart';
// import '../../../../imports.dart';

// class TransactionServices extends GetxService {
//   late final TransactionLocalDataSource localeDataSource;
//   late final TransactionRemoteDataSource remoteDataSource;
//   final AppServices appServices = Get.find<AppServices>();

//   Future<TransactionServices> init() async {
//     localeDataSource = TransactionLocalDataSourceImplement(
//         sharedPreferences: appServices.sharedPreferences);
//     remoteDataSource = TransactionRemoteDataSourceImplement(
//       uid: appServices.uid,
//     );
//     return this;
//   }
// }
