// import 'package:get/get.dart';

// import '../../../../features/wallet/data/data sources/local/ecpenses_local_data_source.dart';
// import '../../../../features/wallet/data/data sources/remote/payment_remote_data_source.dart';
// import 'app_services.dart';

// class PaymentServices extends GetxService {
//   late final PaymentLocalDataSource paymentLocalDataSource;
//   late final PaymentRemoteDataSource paymentRemoteDataSource;
//   AppServices appServices = Get.find<AppServices>();

//   Future<PaymentServices> init() async {
//     paymentLocalDataSource = PaymentLocalDataSourceImplement(
//         sharedPreferences: appServices.sharedPreferences);
//     paymentRemoteDataSource =
//         PaymentRemoteDataSourceImplement(uid: appServices.uid);
//     return this;
//   }
// }
