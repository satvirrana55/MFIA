// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/helper/helper_functions.dart';
import 'package:mi_studio/screens/profile/controller/profile_controller.dart';
import 'package:mi_studio/widgets/custom_webview.dart';

import 'auth_controller/auth_controller.dart';
import 'login_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController userNameController = TextEditingController();

  AuthController authController = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ProfileController profileController = Get.find<ProfileController>();
  FocusNode emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HelperUtility.transparentAppBar(),
      backgroundColor: ColorConstants.whiteColor,
      body: body(),
    );
  }

  Widget body() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          FadeAnimation(
              delay: 1,
              child: Hero(
                  tag: 'logo',
                  transitionOnUserGestures: false,
                  child: Image.asset(
                    AppImages.appLogo,
                    width: 111.sp,
                    height: 39.sp,
                  ))),
          HelperUtility.customText(
              title: 'B2B App',
              color: ColorConstants.blackColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w600),
          SizedBox(
            height: 70.sp,
          ),
          Center(
            child: HelperUtility.customText(
                title: 'Welcome Again',
                color: ColorConstants.blackColor,
                fontSize: 18.sp,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 6.sp,
          ),
          HelperUtility.customText(
              title: 'Forget password',
              color: ColorConstants.darkGreyColor,
              fontSize: 12.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w300),
          SizedBox(
            height: 20.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: CustomTextFormField(
                focusNode: emailFocusNode,
                type: TextInputType.emailAddress,
                validator: HelperFunctions.emailValidator,
                controller: userNameController,
                hintText: 'Your Email'),
          ),
          SizedBox(
            height: 12.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: CustomButton(
              callback: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomWebView(isReset: true,
                              urlRequest: URLRequest(
                                  url: Uri.parse(
                                      "https://mistudiobrand.com/login.php?action=Send_password_email"),
                                  method: 'POST',
                                  body: Uint8List.fromList(utf8.encode(
                                      "email=${userNameController.text}"))))));
                }
              },
              title: 'Reset Password',
            ),
          ),
          SizedBox(
            height: 15.sp,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Login to account',
                style: CustomTextStyle.smallTextStyle.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    color: ColorConstants.darkGreyColor)),
            TextSpan(
                text: 'Sign in',
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Get.offAll(() => const LoginScreen()),
                style: CustomTextStyle.smallTextStyle
                    .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600)),
          ])),
          SizedBox(
            height: 15.sp,
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }

  unFocusNode() {
    emailFocusNode.unfocus();
  }
}
