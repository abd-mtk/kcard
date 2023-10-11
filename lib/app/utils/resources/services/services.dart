import 'package:get/get.dart';

import 'app_services.dart';
// import 'auth_services.dart';
// import 'budget_services.dart';
// import 'payment_services.dart';
// import 'home_services.dart';
// import 'transaction_services.dart';
// import 'user_services.dart';

Future initServices() async {
  await Get.putAsync(() => AppServices().init());
  // await Get.putAsync(() => AuthServices().init());
  // await Get.putAsync(() => HomeServices().init());
  // await Get.putAsync(() => UserServices().init());
  // await Get.putAsync(() => BudgetServices().init());
  // await Get.putAsync(() =>  PaymentServices().init());
  // await Get.putAsync(() => TransactionServices().init());
}
