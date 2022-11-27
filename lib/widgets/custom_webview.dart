import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mi_studio/helper/helper_functions.dart';
import 'package:mi_studio/main.dart';
import 'package:mi_studio/screens/auth/login_screen.dart';
import 'package:mi_studio/screens/cart/controller/cart_controller.dart';
import 'package:mi_studio/widgets/tab_navigator.dart';

import '../constants/export.dart';
import '../constants/prefs_key.dart';

class CustomWebView extends StatefulWidget {
  final URLRequest? urlRequest;
  final bool? isFromAuth;
  final bool? isReset;

  const CustomWebView(
      {Key? key, this.urlRequest, this.isFromAuth, this.isReset})
      : super(key: key);

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InAppWebView(
          key: webViewKey,
          initialUrlRequest: widget.urlRequest,
          initialOptions: options,
          onWebViewCreated: (controller) {
            webViewController = controller;

          },
          onLoadStart: (controller, url) {
        if (url!.path == "/checkout/order-confirmation") {
          HelperFunctions.showDoneDialog(context, "Order Confirmed","Continue Shopping",(){
            CartController controller = Get.find<CartController>();
            preferences!.setBool(PrefsKey.isFirstCart, true);

            preferences!.remove(PrefsKey.cartId);
            controller.clearCart();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardScreen()),
                    (route) => false);
          });

        }
        setState(() {
          this.url = url.toString();
          urlController.text = this.url;
        });
      },
          onLoadStop: (controller, url) async {


          }, onProgressChanged: (controller, progress) {
          if (progress == 100) {
            if (widget.isFromAuth == true) {
            Get.offAll(() => const DashboardScreen());
          }
          if (widget.isReset == true) {
            Get.offAll(() => const LoginScreen());
          }
        }

        },
          androidOnPermissionRequest: (controller, origin, resources) async {
            return PermissionRequestResponse(
                resources: resources,
                action: PermissionRequestResponseAction.GRANT);
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            var uri = navigationAction.request.url!;

            if (![
              "http",
              "https",
              "file",
              "chrome",
              "data",
              "javascript",
              "about"
            ].contains(uri.scheme)) {
              // if (await canLaunch(url)) {
              //   // Launch the App
              //   await launch(
              //     url,
              //   );
              //   // and cancel the request
              //   return NavigationActionPolicy.CANCEL;
              // }
            }

            return NavigationActionPolicy.ALLOW;
          },
          onUpdateVisitedHistory: (controller, url, androidIsReload) {
            setState(() {
              this.url = url.toString();
              urlController.text = this.url;
            });
          },
          onConsoleMessage: (controller, consoleMessage) {},
        ));
  }

  void onLoadResource(response) {
    print("Started at: " +
        response.startTime.toString() +
        "ms ---> duration: " +
        response.duration.toString() +
        "ms " +
        (response.url ?? '').toString());
  }
}