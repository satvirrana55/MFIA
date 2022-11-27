
import '../constants/export.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool? isObscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool? isNumeric;
  final bool? isThreeLine;
  final String? hintText;
  final TextInputType? type;
  final bool? isColor;
  final bool? hasIcon;
  final VoidCallback? onTapIcon;

  const CustomTextFormField(
      {Key? key,
      required this.controller,
      this.focusNode,
      this.hintText,
      this.type,
      this.isObscureText,
      this.validator,
      this.onChanged,
      this.onTap,
      this.onTapIcon,
      this.isNumeric,
      this.hasIcon,
      this.isThreeLine,
      this.isColor = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      style: CustomTextStyle.smallTextStyle.copyWith(
          fontSize: 15.sp,
          color: ColorConstants.blackColor,
          fontWeight: FontWeight.w700),
      maxLines: isThreeLine == true ? 3 : 1,
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      cursorColor: ColorConstants.blackColor,
      keyboardType:
          isNumeric == true ? TextInputType.number : type ?? TextInputType.text,
      focusNode: focusNode,
      obscureText: isObscureText == true ? true : false,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        fillColor: isColor == true
            ? ColorConstants.lightGreyColor
            : ColorConstants.whiteColor,
        filled: true,
        suffixIcon: hasIcon == true
            ? GestureDetector(
                onTap: onTapIcon,
                child: Icon(isObscureText == true
                    ? Icons.visibility
                    : Icons.visibility_off,color: Colors.black,))
            : const SizedBox(width: 1,height: 1),
        hintText: hintText,suffixIconColor: Colors.black,
        hintStyle: CustomTextStyle.smallTextStyle
            .copyWith(fontSize: 12.sp, color: ColorConstants.darkGreyColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.sp),
          borderSide: BorderSide(color: ColorConstants.lightGreyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.sp),
          borderSide: BorderSide(
            color: ColorConstants.lightGreyColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.sp),
          borderSide: BorderSide(color: ColorConstants.lightGreyColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.sp),
          borderSide: BorderSide(color:ColorConstants.lightGreyColor),
        ),

      ),
    );
  }
}
class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool? isObscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool? isNumeric;
  final bool? isThreeLine;
  final String? labelText;
  final TextInputType? type;

  const CommonTextField(
      {Key? key,
      required this.controller,
      this.focusNode,
      this.labelText,
      this.type,
      this.isObscureText,
      this.validator,
      this.onChanged,
      this.onTap,
      this.isNumeric,
      this.isThreeLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      keyboardType: isNumeric == true ? TextInputType.number : type ?? TextInputType.text,
      style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,fontFamily: "Poppins",color: ColorConstants.blackColor),
      decoration: InputDecoration(
          errorMaxLines: 2,
          errorStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              color: Colors.red),
          filled: true,
          fillColor: ColorConstants.whiteColor,
          enabledBorder: InputBorder.none,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.sp),
              borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.sp),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.sp),
              borderSide: BorderSide.none
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.sp),
              borderSide: BorderSide.none
          ),
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 9.sp,fontWeight: FontWeight.w400,fontFamily: "Poppins",color: ColorConstants.darkGreyColor)
      ),
      focusNode: focusNode,
    );
  }
}

