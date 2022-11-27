
import 'package:mi_studio/constants/export.dart';

import 'package:percent_indicator/percent_indicator.dart';


import 'spalsh_controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: HelperUtility.transparentAppBar(),
      body: body(),
      backgroundColor: ColorConstants.whiteColor,
    );
  }

  Widget body() {
    return GetBuilder<SplashController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          FadeAnimation(
              delay: 1,
              child: Hero(
                  tag: 'logo',
                  transitionOnUserGestures: false,
                  child: Image.asset(AppImages.appLogo))),
          HelperUtility.customText(
              title: 'B2B App',
              color: ColorConstants.blackColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w600),
          const Spacer(),
          Text(
            "${controller.percent.round()}%",
            style: CustomTextStyle.smallTextStyle,
          ),
          SizedBox(
            height: 5.sp,
          ),
          Center(
            child: LinearPercentIndicator(
              animation: true,
              animationDuration: 4000,
              width: 180.0.sp,
              lineHeight: 6.0.sp,
              alignment: MainAxisAlignment.center,
              percent: controller.percent / 100,
              animateFromLastPercent: true,
              barRadius: Radius.circular(5.r),
              backgroundColor: ColorConstants.greyColor,
              progressColor: ColorConstants.blackColor,
            ),
          ),
          const Spacer(flex: 2),
          HelperUtility.customText(
              title: 'App Ver. ${controller.packageInfo.version}',
              color: ColorConstants.blackColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400),
          SizedBox(
            height: 10.sp,
          )
        ],
      );
    });
  }
}
