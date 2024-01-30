import 'dart:async';
import 'dart:ui';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import '../../../utils/common_widgets/buttons/filled_button_widget.dart';
import '../../../utils/common_widgets/common.dart';
import '../../../utils/common_widgets/otp_pin_fields_widget.dart';
import '../../../utils/common_widgets/styles.dart';
import '../../../utils/common_widgets/text_widget.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_theme.dart';
import '../../../utils/constants/routes.dart';
import '../../../utils/constants/strings.dart';
import '../../data/model/login_user_request_model.dart';
import '../bloc/login_user_bloc.dart';

final globalKey = GlobalKey<OtpPinFieldState>();
class LoginUserOtp extends StatefulWidget {
  final String action;
  final String name;


  const LoginUserOtp(
      {Key? key,
        required this.action,
        required this.name})
      : super(key: key);

  //const LoginUserOtp({super.key});
  @override
  State<LoginUserOtp> createState() => _LoginUserOtpState();
}

class _LoginUserOtpState extends State<LoginUserOtp> {
  late String currentOtp;
  String? otp;

  late Timer _timer;
  final timerValue = 0;
  String _timerText = "00:00";
  final GlobalKey<State<StatefulWidget>> otpKey = GlobalKey<State<StatefulWidget>>();

  @override
  void initState() {
    currentOtp = ""; // Initialize OTP to an empty string
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginUserBloc, LoginUserState>(
        listener: (context, state) {},
        child: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: AppTheme.whiteColor,
              body: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: _body(context),
                  )),
            )));
  }

  Widget _body(BuildContext context) {
    return BlocListener<LoginUserBloc, LoginUserState>(
      listener: (BuildContext context, state) {
        if(state is OtpVerifySuccess){
          Navigator.pushNamed(context, Routes.dashboardPageRoute);
        }
        if (state is OtpVerifyFailure) {
          FocusManager.instance.primaryFocus?.unfocus();
          // toast("Invalid OTP");
        }
      },
      child: RefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.90,
                        child: Center(
                            child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 160,
                                      width: 160,
                                      child: Image.asset(logo),
                                    ),
                                    vSpace(36),
                                    const TextWidget(
                                      enterVerificationCode,
                                      size: 20,
                                      color: AppTheme.headingtextBlackColor,
                                      weight: FontWeight.w600,
                                    ),
                                    vSpace(20),
                                    OtpPinField(
                                        //key: globalKey,
                                        key: otpKey,
                                        onSubmit: (text) {
                                          otp = text;
                                        },
                                        onChange: (text) {
                                          otp = text;
                                        },
                                        fieldHeight: 57,
                                        fieldWidth: 57,
                                        otpPinFieldStyle: OtpPinFieldStyle(
                                          textStyle: const TextStyle(
                                              fontSize: 24, color: AppTheme.textBlackColor),
                                          defaultFieldBorderColor: context.read<LoginUserBloc>().otpErr != null
                                              ? AppTheme.redColor
                                              : AppTheme.borderGreyColor.withOpacity(0.2),
                                          activeFieldBorderColor: AppTheme.btnOrange1,
                                          defaultFieldBackgroundColor:AppTheme.whiteColor,
                                          activeFieldBackgroundColor:AppTheme.whiteColor,
                                        ),
                                        maxLength: 4,
                                        cursorColor: AppTheme.orangeColor,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        otpPinFieldDecoration: OtpPinFieldDecoration.roundedPinBoxDecoration
                                    ),
                                    vSpace(30),
                                    FilledButtonWidget(
                                      text: verify,
                                      height: 55,
                                      width: 360,
                                      textColor: AppTheme.whiteColor,
                                      borderRadiusCircular: 25,
                                      paddingHorizontal: 0.007,
                                      paddingVertical: 0.023,
                                      textSize: 16,
                                      onSubmit: () {
                                        context.read<LoginUserBloc>().add(
                                            OtpVerifyTapped(widget.action,widget.name,otp??'')
                                        );
                                      },
                                    ),
                                    vSpace(30),
                                    _resendOTP(context),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.center,
                                    //   children: [
                                    //     const TextWidget(
                                    //       didNotReceiveCode,
                                    //       size: 18,
                                    //       color: AppTheme.hintColor,
                                    //       weight: FontWeight.w600,
                                    //     ),
                                    //     hSpace(5),
                                    //     const TextWidget('00:30s',
                                    //       size: 20,
                                    //       color: AppTheme.btnOrange,
                                    //       weight: FontWeight.w600,
                                    //     ),
                                    //   ],
                                    // )
                                  ],
                                ))))
                  ]))),
    );
  }

  Widget _resendOTP(BuildContext context) {
    return BlocBuilder<LoginUserBloc, LoginUserState>(
       // buildWhen: (previous, current) => current is ResendOtpSuccess,
        builder: (context, state) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            const TextWidget(didNotReceiveCode,
              size: 18,
              color: AppTheme.hintColor,
              weight: FontWeight.w600,),
            hSpace(5),
            Center(
                child: InkWell(
                  onTap: () {
                    context.read<LoginUserBloc>().add(GetVerificationEvent(
                        LoginUserRequestModel(action: 'resend', name: widget.name),
                        widget.name));
                    // if (!context.read<OtpBloc>().isResendOtpTapped) {
                    //   context
                    //       .read<OtpBloc>()
                    //       .add(ResendOtpTapped(SendOtpRequestModel(
                    //     mobileNumber: widget.mobileNo,
                    //     CountryCodeNull: widget.countryCodeFlag,
                    //     countryCode: widget.countryCode,
                    //     roleId: userRoleId,
                    //     isPhoneNumberChange: widget.isThisChangeNumberRequest,
                    //   )));
                    // }
                  },
                  child: const TextWidget(resendOtp,
                      size: 18,
                      color: AppTheme.hintColor,
                      weight: FontWeight.w600,
                      // color: context.read<LoginUserBloc>().isResendOtpTapped
                      //     ? AppTheme.greyColor
               ),
                ))
          ]);
        });
  }


}
