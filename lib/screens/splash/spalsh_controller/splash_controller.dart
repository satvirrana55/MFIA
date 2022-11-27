import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/constants/prefs_key.dart';
import 'package:mi_studio/main.dart';
import 'package:mi_studio/models/user_data_model.dart';
import 'package:mi_studio/network/network_services/big_commerece_http_apis/api_services.dart';
import 'package:mi_studio/screens/auth/login_screen.dart';
import 'package:mi_studio/screens/profile/controller/profile_controller.dart';
import 'package:mi_studio/widgets/tab_navigator.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashController extends GetxController {
  double percent = 0.0;
  Timer? timer;
  ProfileController profileController = Get.find<ProfileController>();
  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: '0',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();

    packageInfo = info;
  }

  Future<void> generateToken() async {
    DateTime now = DateTime.now();
    ApiServices().generateToken({
      "channel_id": 1,
      "expires_at":
          (DateTime(now.year, now.month, now.day + 1).millisecondsSinceEpoch /
                  1000)
              .round(),
      "allowed_cors_origins": ["https://mistudiobrand.com"]
    }).then((value) {
      preferences!.setString(PrefsKey.bearerToken, value.data!.data!.token!);
      log(preferences!.getString(PrefsKey.bearerToken).toString());
      update();
    });
  }

  @override
  void onInit() {
    generateToken();
    _initPackageInfo();

    timer = Timer.periodic(const Duration(milliseconds: 3000), (_) {
      percent += 33.3;
      update();
      if (percent.round() >= 100) {
        timer!.cancel();
        onTimeDone();
        // percent=0;
      }
    });
    super.onInit();
  }

  onTimeDone() {
    if (preferences!.getString(PrefsKey.userInfo) != null) {
      profileController.getUserData(userDataModelFromJson(
          preferences!.getString(PrefsKey.userInfo).toString()));
      log("Details:- ${preferences!.getString(PrefsKey.userInfo).toString()}");
      Get.offAll(() => const DashboardScreen());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }
}
