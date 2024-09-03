import 'package:book_finder_flutter_demo/core/index.dart';
import 'package:book_finder_flutter_demo/src/auth/presentation/providers/auth_provider.dart';
import 'package:book_finder_flutter_demo/src/index.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final userInfo = await LocalStorageHandler.getUserInfoLocalStorage();
  ServiceLocator.setupLocator();
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
  runApp(MainApp(
    userInfo: userInfo,
  ));
}

class MainApp extends StatelessWidget {

  final Map<String, dynamic> userInfo;

  const MainApp({
    required this.userInfo,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider.fromMap(userInfo)),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
