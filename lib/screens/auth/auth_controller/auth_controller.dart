// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:country_code_picker/country_code.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:language_picker/languages.dart';
import 'package:mi_studio/app_controller.dart';
import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/models/base_model.dart';
import 'package:mi_studio/models/user_data_model.dart';
import 'package:mi_studio/models/validate_user_model.dart';
import 'package:mi_studio/network/network_services/big_commerece_http_apis/api_services.dart';
import 'package:mi_studio/widgets/custom_webview.dart';
import 'package:mi_studio/widgets/loader_dialog.dart';

import '../../../constants/prefs_key.dart';
import '../../../helper/helper_functions.dart';
import '../../../main.dart';
import '../../profile/controller/profile_controller.dart';

class AuthController extends GetxController {
  bool isCaptcha = false;
  bool isTermsAccepted = false;
  CountryCode? pickedData;
  Language? selectedDialogLanguage;
  ProfileController profileController = Get.find<ProfileController>();
  UserDataModel? userInfo;

  String data_id = "";

  updateCaptcha(bool val) {
    isCaptcha = val;
    update();
  }

  updateTerms(bool val) {
    isTermsAccepted = val;
    update();
  }

  updateCountry(CountryCode val) {
    pickedData = val;
    update();
  }

  updateLanguage(Language val) {
    selectedDialogLanguage = val;
    update();
  }

  void login(BuildContext context, String userName, String password) async {
    //validation check
    // loaderInit
    LoaderDialog.showLoadingDialog(context);
    // get response from api class
    ValidateUserModel response =
        await letValidateUser(context, email: userName, password: password);
    log(response.customerId.toString());
    // check if user is valid
    if (response.isValid == true) {
      generateToken();

      UserDataModel userDataModel =
          await getUserData(response.customerId!, context);

      await preferences!
          .setString(PrefsKey.userInfo, userDataModelToJson(userDataModel));
      log('message qwer<><<><><:- ${preferences!.setString(PrefsKey.userInfo, userDataModelToJson(userDataModel))}');

      preferences!.setBool(PrefsKey.token, true);

      String? userDetail = preferences!.getString(PrefsKey.userInfo);
      if (userDetail != null) {
        profileController.getUserData(userDataModelFromJson(
            preferences!.getString(PrefsKey.userInfo).toString()));

        userInfo = UserDataModel.fromJson(json.decode(userDetail));
        Get.find<AppController>().userInfo = userDataModel;
        update();
      }
      log("user Info0: $userInfo");
      log("User Info1:- ${userInfo!.toJson()}");
      preferences!.setBool(PrefsKey.isFirstCart, true);

      //profileController.getUserData(userDataModel);
      Get.back();
       log("This is my username and passeord login_email=$userName&login_pass=$password");
       var u = URLRequest(
           url: Uri.parse(
               "https://mistudiobrand.com/login.php?action=check_login"),
           method: 'POST',
           body: Uint8List.fromList(
               utf8.encode("login_email=$userName&login_pass=$password")));
       log("<><><><><><><><><><><><><><><><><><><>${u.method}");
     if(userInfo!.data!.first.customerGroupId! == 1){
       Get.offAll(() => CustomWebView(
         urlRequest: u,
         isFromAuth: true,
       ));
     }else{
       Get.back();
       HelperFunctions.showErrorDialog(
           context, 'User is not valid');
     }
    } else {
      Get.back();
      HelperFunctions.showErrorDialog(
          context, 'The username or password you entered is incorrect');
    }
  }

  Future<ValidateUserModel> letValidateUser(BuildContext context,
      {String? email, String? password}) async {
    Map<String, dynamic> map = {
      "email": email,
      "password": password,
      "channel_id": 1
    };
    BaseModel<ValidateUserModel> response =
        await ApiServices().validateUser(context, map);
    return response.data!;
  }

  Future<UserDataModel> getUserData(
      int customerId, BuildContext context) async {
    BaseModel<UserDataModel> response =
        await ApiServices().getUserData(customerId, context);
    return response.data!;
  }

  void createUser(
    BuildContext context, {
    String? email,
    String? firstName,
    String? lastName,
    String? company,
    String? phone,
    String? address,
    String? city,
    String? state,
    String? postalCode,
    String? password,
    String? countryCode,
  }) async {
    Map<String, dynamic> map = {
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "company": company,
      "phone": phone,
      "customer_group_id": 1,
      "addresses": [
        {
          "address1": address,
          "city": city,
          "country_code": countryCode,
          "first_name": firstName,
          "last_name": lastName,
          "phone": phone,
          "postal_code": postalCode,
          "state_or_province": state,
        }
      ],
      "authentication": {
        "force_password_reset": false,
        "new_password": password
      },
      "origin_channel_id": 1,
      "channel_ids": [1]
    };
    List<Map<String, dynamic>> mapList = [map];
    LoaderDialog.showLoadingDialog(context);
    BaseModel<UserDataModel> response =
        await ApiServices().createNewUser(context, mapList);

    log(userDataModelToJson(response.data!));

    UserDataModel userDataModel =
        userDataModelFromJson(userDataModelToJson(response.data!));

    if (userDataModel.data!.isNotEmpty) {
      generateToken();
      profileController.getUserData(userDataModel);
      await preferences!
          .setString(PrefsKey.userInfo, userDataModelToJson(userDataModel));

      String? userDetail = preferences!.getString(PrefsKey.userInfo);
      if (userDetail != null) {
        profileController.getUserData(userDataModelFromJson(
            preferences!.getString(PrefsKey.userInfo).toString()));
        profileController = Get.find<ProfileController>();

        userInfo = UserDataModel.fromJson(json.decode(userDetail));
        Get.find<AppController>().userInfo = userDataModel;
        update();
      }

      if (userDetail != null) {
        preferences!.setBool(PrefsKey.token, true);

        String? userDetail = preferences!.getString(PrefsKey.userInfo);
        if (userDetail != null) {
          userInfo = UserDataModel.fromJson(json.decode(userDetail));
          update();
        }
        preferences!.setBool(PrefsKey.isFirstCart, true);

        profileController.getUserData(userDataModel);
        Get.back();

       if(userInfo!.data!.first.customerGroupId ==1){
         Get.offAll(() => CustomWebView(
           urlRequest: URLRequest(
               url: Uri.parse(
                   "https://mistudiobrand.com/login.php?action=check_login"),
               method: 'POST',
               body: Uint8List.fromList(
                   utf8.encode("login_email=$email&login_pass=$password"))),
           isFromAuth: true,
         ));
       }
       else{
         Get.back();
         HelperFunctions.showErrorDialog(context, "Not a valid user");
       }
      } else {
        Get.back();
        HelperFunctions.showErrorDialog(context, "Something went wrong");
      }
    }
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

      log("QWERTYUI :- ${preferences!.getString(PrefsKey.bearerToken).toString()}");
      update();
    });
  }
}
