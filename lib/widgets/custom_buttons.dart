
import 'package:mi_studio/constants/export.dart';


class CustomButton extends StatelessWidget {
  final String? title;
  final VoidCallback callback;

  const CustomButton({super.key, this.title, required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 1.sw,
        height: 48.sp,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: ColorConstants.blackColor),
        child: Center(
            child: HelperUtility.customText(
                title: title,
                color: ColorConstants.whiteColor,
                fontSize: 12.sp,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
