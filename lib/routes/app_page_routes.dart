
import '/Pages/home/home_bindings.dart';
import '/Pages/splash%20screen/splash.dart';
import 'app_routes.dart';
import 'package:get/get.dart';
class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => MySplashScreen(),
      binding: HomeBinding(),
    ),
  ];
}
