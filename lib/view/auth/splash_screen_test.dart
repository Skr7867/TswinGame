import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tswin/res/media_query.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tswin/generated/assets.dart';
import '../../utils/routes/routes_name.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _loginState();
}

class _loginState extends State<splash> {
  @override
  void initState() {
    super.initState();
    harsh();
  }

  harsh() async{
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("token")??'0';

    Timer(const Duration(seconds: 3),
            ()=>userid !='0'? Navigator.pushNamed(context, RoutesName.bottomNavBar)
            : Navigator.pushNamed(context, RoutesName.loginScreen)
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = ScreenSize.height(context);
    double width = ScreenSize.width(context);
    return SafeArea(
        child: Scaffold(
            body:SizedBox(
              height: height,
              width: width,
              child: Center(
                child: Container(
                  height: height * 0.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.imagesAppBarSecond),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
        ));
  }
}

