import 'package:flutter/material.dart';
import 'package:tswin/generated/assets.dart';
import 'package:tswin/main.dart';

class ToastLostHelper {
  static void showloss({
    String? subtext,
    String? subtext1,
    String? subtext2,
  }) {
    ToastWidgetLoss.showToast(
      subtext: subtext,
      subtext1: subtext1,
      subtext2: subtext2,
    );
  }
}

class ToastWidgetLoss extends StatefulWidget {
  final String? subtext;
  final String? subtext1;
  final String? subtext2;

  const ToastWidgetLoss({
    Key? key,
    this.subtext,
    this.subtext1,
    this.subtext2,
  }) : super(key: key);

  static void showToast({
    String? subtext,
    String? subtext1,
    String? subtext2,
  }) {
    final overlay = navigatorKey.currentState?.overlay;
    if (overlay == null) return;

    final entry = OverlayEntry(
      builder: (context) => Center(
        child: Material(
          color: Colors.transparent,
          child: ToastWidgetLoss(
            subtext: subtext,
            subtext1: subtext1,
            subtext2: subtext2,
          ),
        ),
      ),
    );

    overlay.insert(entry);
    Future.delayed(const Duration(seconds: 3), () => entry.remove());
  }

  @override
  _ToastWidgetLossState createState() => _ToastWidgetLossState();
}

class _ToastWidgetLossState extends State<ToastWidgetLoss> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width * 0.45, // Adjusted width for better scaling
      height: height * 0.25, // Adjusted height for better scaling
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(Assets.imagesLosePopup),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: height * 0.08),
          Text(
            widget.subtext1 == "1" ? "Green" : widget.subtext1 == "2" ? "Yellow" : "Red",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w900,
              color: widget.subtext1 == "1"
                  ? Colors.green
                  : widget.subtext1 == "2"
                  ? Colors.yellow
                  : Colors.red,
            ),
          ),
          SizedBox(height: height * 0.03),
          Text(
            widget.subtext2 == "" ? "" : "₹${widget.subtext2}",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
