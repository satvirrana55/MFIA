// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/helper/helper_functions.dart';
import 'package:mi_studio/screens/auth/forget_password_screen.dart';
import 'package:mi_studio/screens/profile/controller/profile_controller.dart';

import 'auth_controller/auth_controller.dart';
import 'register_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthController authController = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ProfileController profileController = Get.find<ProfileController>();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool isPasswordVisible = true;

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
              title: 'Please login to your account',
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
            child: CustomTextFormField(
                validator: HelperFunctions.passwordValidator,
                controller: passwordController,
                focusNode: passwordFocusNode,hasIcon: true,
                isObscureText: isPasswordVisible,onTapIcon: (){
                  toggleEye();
            },
                hintText: 'Password'),
          ),
          SizedBox(
            height: 12.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: CustomButton(
              callback: () {
                if (_formKey.currentState!.validate()) {
                  unFocusNode();
                  authController.login(context, userNameController.text,
                      passwordController.text);
                }
              },
              title: 'Sign in',
            ),
          ),
          SizedBox(
            height: 15.sp,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Forgot your credentials? ',
                style: CustomTextStyle.smallTextStyle.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    color: ColorConstants.darkGreyColor)),
            TextSpan(  recognizer: TapGestureRecognizer()
              ..onTap = () => Get.offAll(() => const ForgetPasswordScreen()),
                text: 'Reset Password',
                style: CustomTextStyle.smallTextStyle
                    .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600)),
          ])),
          SizedBox(
            height: 15.sp,
          ),
          HelperUtility.customText(
              title: 'Or',
              color: ColorConstants.darkGreyColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w300),
          SizedBox(
            height: 10.sp,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Don’t have an account? ',
                style: CustomTextStyle.smallTextStyle.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    color: ColorConstants.darkGreyColor)),
            TextSpan(
                text: 'Sign up',
                recognizer: TapGestureRecognizer()
                  ..onTap = () => {Get.to(() => const RegisterPage())},
                style: CustomTextStyle.smallTextStyle
                    .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600)),
          ])),
          const Spacer(flex: 3),
        ],
      ),
    );
  }

  unFocusNode() {
    emailFocusNode.unfocus();
    passwordFocusNode.unfocus();
  }

  void toggleEye(){
    setState(() {
      isPasswordVisible = !isPasswordVisible;

    });
  }
}
