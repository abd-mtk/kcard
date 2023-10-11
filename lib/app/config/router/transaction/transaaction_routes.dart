import 'package:get/get.dart';

import '../../../../features/transaction/presentation/getx/bindings/transaction_binding.dart';
import '../../../../features/transaction/presentation/screens/transaction_edit_screen.dart';
import '../../../../features/transaction/presentation/screens/transaction_received_screen.dart';
import '../../../../features/transaction/presentation/screens/transaction_sent_screen.dart';
import '../../../../features/transaction/presentation/screens/transction_index_screen.dart';

List<GetPage<dynamic>> TRANSACTION = [
  GetPage(
    name: TransactionIndexScreen.routeName,
    page: () => const TransactionIndexScreen(),
    bindings: [TransactionBinding()],
  ),
  GetPage(
    name: TransactionSentScreen.routeName,
    page: () => TransactionSentScreen(),
  ),
  GetPage(
    name: TransactionReceivedScreen.routeName,
    page: () =>  TransactionReceivedScreen(),
  ),
  GetPage(
    name: TransactionEditScreen.routeName,
    page: () =>  TransactionEditScreen(),
  ),
];
