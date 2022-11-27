import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/export.dart';

class LoaderDialog {
  static Future<void> showLoadingDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        SpinKitThreeInOut(
                            color: ColorConstants.blackColor),
                      ]),
                    )
                  ]));
        });
  }
}
