import 'package:flutter/material.dart';
import 'package:tswin/main.dart';
import 'package:tswin/res/aap_colors.dart';
import 'package:tswin/res/components/app_btn.dart';
import 'package:tswin/res/components/text_widget.dart';

class PlinkoPopupPage extends StatelessWidget {
  const PlinkoPopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height*0.2,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF095273),
            Color(0xFF117e67),
            Color(0xFF095273),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
       borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          textWidget(
            textAlign: TextAlign.center,
            text: 'Please Complete your Bet otherwise money will be deducted! ',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.white

          ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             AppBtn(
               height: height*0.04,
               width: width*0.2,
               onTap: (){
                 Navigator.pop(context);
               },
               title: "Cancel",
               fontSize: 15,
             ),
             AppBtn(
               height: height*0.04,
               width: width*0.2,
               onTap: (){
                 Navigator.pop(context);
                 Navigator.pop(context);
               },
               title: "Ok",
               fontSize: 15,
             ),
           ],
         )
        ],
      ),
    );
  }
}
