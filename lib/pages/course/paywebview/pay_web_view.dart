import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/common_widgets.dart';
import 'package:ulearning_app/pages/course/paywebview/bloc/pay_web_view_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayWebView extends StatefulWidget {
  const PayWebView({super.key});

  @override
  State<PayWebView> createState() => _PayWebViewState();
}

class _PayWebViewState extends State<PayWebView> {
  late final WebViewController webViewController;

  @override
  void initState() {
    super.initState();
  }

  // This dependencies called when context changes means args have values,
  // when context are ready we can get arguments from the context.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    // Trigger the event
    context.read<PayWebViewBloc>().add(TriggerWebView(args["url"]));
  }

  @override
  void dispose() {
    webViewController.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayWebViewBloc, PayWebViewState>(
      builder: (context, payWebViewState) {
        return Scaffold(
          appBar: buildAppBar(titleText: "Payment page"),
          body: payWebViewState.url == ""
              ? SizedBox(
                  width: 50.w,
                  height: 50.h,
                  child: const CircularProgressIndicator(),
                )
              : WebView(
                  initialUrl: payWebViewState.url,
                  javascriptMode: JavascriptMode.unrestricted,
                  javascriptChannels: {
                    JavascriptChannel(
                      name: "Pay",
                      onMessageReceived: (JavascriptMessage message) {
                        debugPrint(message.message);
                        Navigator.of(context).pop(message.message);
                      },
                    ),
                  },
                  onWebViewCreated: (WebViewController w) {
                    webViewController = w;
                  },
                ),
        );
      },
    );
  }
}
