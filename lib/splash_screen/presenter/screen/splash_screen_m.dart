import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../login_screens/presenter/bloc/login_bloc.dart';
import '../../../main.dart';
import '../../../utils/common_widgets/common.dart';
import '../../../utils/constants/routes.dart';

class SplashScreenM extends StatefulWidget {
  const SplashScreenM({Key? key}) : super(key: key);

  @override
  State<SplashScreenM> createState() => _SplashScreenMState();
}

class _SplashScreenMState extends State<SplashScreenM> {

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: vendorThemeColor,
      statusBarIconBrightness: Brightness.light,
      // Navigation bar
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      statusBarColor: vendorThemeColor, // Status bar
    ));
    Future.delayed(const Duration(seconds: 3),() async {
      //Navigator.pushReplacementNamed(context, Routes.loginRoute);
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {

    }, builder: (context, state) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.23,
                    width: MediaQuery.of(context).size.height * 0.35,
                    child: Image.asset('assets/keyssLogo.jpg')),
                vSpace(MediaQuery.of(context).size.height * 0.05)
              ])));
    });
  }
}
