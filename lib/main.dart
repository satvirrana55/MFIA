import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/services.dart';
import 'package:mi_studio/screens/auth/auth_controller/auth_controller.dart';
import 'package:mi_studio/screens/cart/controller/cart_controller.dart';
import 'package:mi_studio/screens/profile/controller/profile_controller.dart';
import 'package:mi_studio/screens/splash/splash_screen.dart';
import 'package:mi_studio/translation_file/local_translation_string.dart';
import 'app_controller.dart';
import 'constants/export.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
SharedPreferences? preferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final prefs = await SharedPreferences.getInstance();
  Get.put(prefs, permanent: true);
  preferences = prefs;

  Get.put(AppController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
            locale: const Locale('en'),
            translations: LocalTransalationString(),
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            localizationsDelegates: const [
              CountryLocalizations.delegate,
            ],
            onInit: () {
              Get.put(ProfileController(), permanent: true);
              Get.put(AuthController(), permanent: true);
              Get.put(CartController(), permanent: true);
            },
            home: const SplashScreen());
      },
    );
  }
}
