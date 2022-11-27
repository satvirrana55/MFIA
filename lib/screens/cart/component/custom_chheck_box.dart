import 'package:mi_studio/constants/export.dart';
import 'package:mi_studio/screens/cart/controller/cart_controller.dart';

class CustomCheckBox extends StatefulWidget {
  final bool isselected;
  const CustomCheckBox({Key? key,this.isselected= false}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller){
        return InkWell(
          onTap: () {
            controller.ischeck(widget.isselected);
          },
          child: Container(
            height: 20.sp,
            width: 20.sp,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.sp),
                color:  widget.isselected?ColorConstants.blackColor:ColorConstants.whiteColor,
                border: Border.all(width: 2, color: widget.isselected?ColorConstants.whiteColor:ColorConstants.darkGreyColor)
            ),
            child: widget.isselected ? Center(
              child: Icon(
                Icons.check,
                size: 18.0,
                color: Colors.white,
              ),
            ) : Container(),
          ),
        );
      },
    );
  }
}
