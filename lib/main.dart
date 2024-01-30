import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:keystatus/internet_service/internet_bloc.dart';
import 'package:keystatus/splash_screen/presenter/screen/splash_screen_m.dart';
import 'package:keystatus/utils/common_widgets/shared_pref.dart';
import 'package:keystatus/utils/constants/app_assets.dart';
import 'package:keystatus/utils/constants/app_theme.dart';
import 'package:keystatus/utils/constants/routes.dart';
import 'package:keystatus/utils/constants/strings.dart';
import 'package:keystatus/utils/hive/hive_register_adapter.dart';
import 'package:keystatus/utils/navigation_servie.dart';

import 'dashboard_module/presenter/dashboard_screen.dart';
import 'di.dart';
import 'login_screens/presenter/bloc/login_bloc.dart';
import 'login_screens/presenter/screen/login_screen.dart';
import 'login_user_screens/data/model/login_user_request_model.dart';
import 'login_user_screens/presenter/bloc/login_user_bloc.dart';
import 'login_user_screens/presenter/screen/login_user_otp.dart';
import 'login_user_screens/presenter/screen/login_user_screen.dart';
int? colorValue;
String colorString = SharedPref.getString(SharedPref.vendorColorTheme,
    def: AppTheme.redColor.value.toString());
Color? vendorThemeColor;

void main() async {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjections();
  configLoading();

  await Hive.initFlutter();
  HiveRegisterAdapter.registerAdapters();
  await HiveRegisterAdapter.openBox();

  await SharedPref.load();
  await Future.delayed(const Duration(milliseconds: 300));


  runApp(MyApp(navigatorKey: navigatorKey));
}


class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const MyApp({Key? key, required this.navigatorKey}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    colorValue = int.tryParse(colorString ) ?? AppTheme.redColor.value;
    vendorThemeColor = AppTheme.whiteColor;

    return MultiBlocProvider(
        providers: [
          BlocProvider<InternetBloc>(
            create: (BuildContext context) => InternetBloc(),
          ),
          BlocProvider<LoginBloc>(
              create: (BuildContext context) => LoginBloc(),
          ),
          BlocProvider<LoginUserBloc>(
            create: (BuildContext context) => LoginUserBloc(),
          ),
        ],
        child: MaterialApp(
          title: appName,
          // themeMode: ThemeMode.dark,
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: vendorThemeColor ?? AppTheme.yellowColor,
              fontFamily: proximaNova,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: vendorThemeColor ?? AppTheme.yellowColor),
              progressIndicatorTheme:
              ProgressIndicatorThemeData(color: vendorThemeColor),
              tabBarTheme: TabBarTheme(
                  indicatorColor: vendorThemeColor,
                  dividerColor: vendorThemeColor)),
           //initialRoute: Routes.loginUserRoute,
          initialRoute: Routes.splashRoute,
          // home: OtpScreen(mobileNo: '9579242354'),
          navigatorKey: NavigationService.navigatorKey,
          routes: <String, WidgetBuilder>{
            Routes.splashRoute: (context) => const SplashScreenM(),
            Routes.loginRoute: (context) => const LoginScreen(),
            Routes.loginUserRoute: (context) => const LoginUserScreen(),
            Routes.dashboardPageRoute: (context) => const Dashboard(),
            Routes.loginUserOtpRoute: (context){
              var args = ModalRoute.of(context)?.settings.arguments
              as LoginUserRequestModel;
              return LoginUserOtp(action: args.action!, name: args.name!);
            },
           /* Routes.resetPasswordRoute: (context) {
              var args = ModalRoute.of(context)?.settings.arguments
              as OtpArgumentssModel;
              return ResetPasswordPage(
                  email: args.email ?? '', mobileNo: args.mobileNumber ?? '');
            },*/
          },
        ));
  }
}
void configLoading() {
  EasyLoading.instance
    ..backgroundColor = AppTheme.whiteColor
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 20.0
    ..boxShadow = <BoxShadow>[]
    ..backgroundColor = Colors.transparent
    ..indicatorColor = AppTheme.yellowColor
    ..textColor = AppTheme.whiteColor
    ..userInteractions = false
    ..dismissOnTap = false;
}
