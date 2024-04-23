import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ordering/modules/auth/page/intro.dart';
import 'package:food_ordering/modules/auth/page/login.dart';
import 'package:food_ordering/modules/home/page/bottomTabs.dart';
import 'package:food_ordering/modules/home/page/home.dart';
import 'package:food_ordering/routers/router.dart';
import 'package:food_ordering/utils/hive_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.light);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
await loadHive();
  runApp(const ProviderScope(child: MyApp()));
}
// final logged = Provider<String>((ref) {
//   if (HiveUser.isFirstTime() ) {
//     return LoginPage.routerName; // Welcome page (Onboarding)
//   } else if (HiveUser.isLogged()) {
//     return ScreenModel.routerName;
//   } else {
//     return IntroPage.routerName;
//   }
// });

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // final page=ref.watch(logged);
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routers.routes,
      initialRoute: ScreenModel.routerName,
    );
  }
}
