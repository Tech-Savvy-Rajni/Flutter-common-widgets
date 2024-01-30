// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../login_screens/presenter/bloc/login_bloc.dart';
// import '../../../main.dart';
// import '../../../utils/common_widgets/shared_pref.dart';
// import '../../../utils/constants/app_theme.dart';
//
// class SplashScreen extends StatefulWidget {
//   final bool? isFrom;
//   const SplashScreen({Key? key, this.isFrom}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       systemNavigationBarColor: vendorThemeColor,
//       statusBarIconBrightness: Brightness.light,
//       // Navigation bar
//       systemNavigationBarIconBrightness: Brightness.light,
//       statusBarBrightness: Brightness.light,
//
//       statusBarColor: vendorThemeColor, // Status bar
//     ));
//
//     if (SharedPref.getBool(SharedPref.isStopOnboardingKey, def: false) &&
//         !SharedPref.getBool(SharedPref.isDeliveryLogout, def: false)) {
//       if (widget.isFrom == null) {
//         Future.delayed(
//           const Duration(seconds: 3),
//           () async {
//             // Check for user type
//             // if Delivery partner then navigate to delivery botton bar
//             if (SharedPref.getBool(SharedPref.isDeliveryPartner, def: false)) {
//
//             } else {
//
//             }
//             SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//               systemNavigationBarColor: AppTheme.whiteColor,
//               statusBarIconBrightness: Brightness.dark,
//               // Navigation bar
//               systemNavigationBarIconBrightness: Brightness.dark,
//               statusBarBrightness: Brightness.light,
//               statusBarColor: AppTheme.whiteColor, // Status bar
//             ));
//           },
//         );
//       }
//     }
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<LoginBloc, LoginState>(
//       listener: (context, state) {
//
//       },
//       builder: (context, state) {
//         return Scaffold(
//           backgroundColor: Colors.red,
//           body: Center(
//             child: SingleChildScrollView(
//               child: Container(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       height: 160,
//                       width: 160,
//                       child: Image.asset('assets/keyssLogo.png'),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(top: 36),
//                       child: Text(
//                         'Sign in to KEYSS',
//                         style: TextStyle(
//                             fontSize: 22,
//                             fontFamily: 'Proxima Nova',
//                             color: Colors.black,
//                             fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
//                       child: Container(
//                         width: 335,
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             prefixIcon: const Icon(
//                               Icons.email_outlined,
//                               size: 22,
//                               color: Colors.orange,
//                             ),
//                             labelText: 'Enter your credentials',
//                             hintText: 'abc@keyss.in',
//                             labelStyle: const TextStyle(color: Colors.orange),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1.0),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(25.0),
//                             ),
//                             contentPadding: EdgeInsets.only(
//                                 top: 15, bottom: 15, left: 15, right: 15),
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(25.0),
//                                 borderSide: const BorderSide(color: Colors.orange)),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(25.0),
//                               borderSide: const BorderSide(
//                                 width: 1.0,
//                                 color: Colors.orange,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(25),
//                             gradient: const LinearGradient(colors: [
//                               Color(0xffF79535),
//                               Color(0xffF15A25),
//                             ])),
//                         height: 50,
//                         width: 300,
//                         child: MaterialButton(
//                           child: Text(
//                             'GET VERIFICATION CODE',
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                           onPressed: () {
//                             print("Proceed for next step");
//                           },
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
