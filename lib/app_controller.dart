import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/constants/prefs_key.dart';
import 'package:mi_studio/main.dart';
import 'package:mi_studio/models/user_data_model.dart';

class AppController extends GetxController {
  UserDataModel? userInfo;

  @override
  void onInit() {
    String? userDetail = preferences!.getString(PrefsKey.userInfo);
    if (userDetail != null) {
      userInfo = UserDataModel.fromJson(json.decode(userDetail));
      update();
    }

    super.onInit();
  }
}
