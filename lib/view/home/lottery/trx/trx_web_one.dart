import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:tswin/res/aap_colors.dart';
import 'package:tswin/res/components/app_bar.dart';
import 'package:tswin/res/components/app_btn.dart';
import 'package:tswin/res/components/text_widget.dart';

class TRXwebPUBLIC extends StatefulWidget {
  final String url;

  const TRXwebPUBLIC({super.key, required this.url});

  @override
  TRXwebPUBLICState createState() => TRXwebPUBLICState();
}

class TRXwebPUBLICState extends State<TRXwebPUBLIC> {
  late WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      // Automatically open the URL in a browser for the web
      _launchURL();
    }
  }

  // This method handles URL launching for web
  Future<void> _launchURL() async {
    if (await canLaunch(widget.url)) {
      await launch(widget.url);
    } else {
      throw 'Could not launch ${widget.url}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GradientAppBar(
          leading: const AppBackBtn(),
          title: textWidget(
              text: 'TRX', fontSize: 25, color: AppColors.primaryTextColor),
          gradient: AppColors.primaryGradient,
        ),
        body: kIsWeb
            ? _buildForWeb() // Web-specific behavior
            : _buildForMobile(), // Mobile-specific WebView
      ),
    );
  }

  // Web-specific build method
  Widget _buildForWeb() {
    return Center(
      child: Text(
        'Opening TRX page in a new browser tab...',
        style: TextStyle(fontSize: 18, color: AppColors.primaryTextColor),
      ),
    );
  }

  // Mobile-specific WebView build method
  Widget _buildForMobile() {
    return Column(
      children: <Widget>[
        if (_isLoading)
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white, // Set your desired background color
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        Expanded(
          child: WebView(
            backgroundColor: Colors.transparent,
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
              webViewController.clearCache();
              final cookieManager = CookieManager();
              cookieManager.clearCookies();
            },
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith('upi://')) {
                launch(request.url);
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
            onPageStarted: (String url) {
              setState(() {
                _isLoading = true;
              });
            },
            onPageFinished: (String url) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
        ),
      ],
    );
  }
}
