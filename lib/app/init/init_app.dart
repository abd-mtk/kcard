import 'imports.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initServices();
}
