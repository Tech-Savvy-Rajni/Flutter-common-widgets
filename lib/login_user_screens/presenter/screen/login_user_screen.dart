import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/common_widgets/buttons/filled_button_widget.dart';
import '../../../utils/common_widgets/common.dart';
import '../../../utils/common_widgets/text_widget.dart';
import '../../../utils/common_widgets/textformfield/hint_textformfield_widget.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_theme.dart';
import '../../../utils/constants/routes.dart';
import '../../../utils/constants/strings.dart';
import '../../data/model/login_user_request_model.dart';
import '../bloc/login_user_bloc.dart';

class LoginUserScreen extends StatefulWidget {
  const LoginUserScreen({Key? key}) : super(key: key);
  @override
  State<LoginUserScreen> createState() => _LoginUserScreenState();
}

class _LoginUserScreenState extends State<LoginUserScreen> {
  final TextEditingController _emailController = TextEditingController();
  String _emailTextFieldValue = '';

  @override
  void initState() {
    super.initState();
    context.read<LoginUserBloc>().add(LoadLoginInitialData());
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
        if (state is LoginSuccess) {
          Navigator.pushNamed(context, Routes.loginUserOtpRoute,arguments: LoginUserRequestModel(
              action: 'confirm',
              name: _emailTextFieldValue,
          ));
        }
      },
      child: RefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      signInToKEYSS,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: proximaNova,
                          color: AppTheme.headingtextBlackColor,
                          fontWeight: FontWeight.w600),
                    ),
                    vSpace(28),
                    HintTextFormFieldWidget(
                      hintText: enterYourEmail,
                      controller: _emailController,
                      borderRadiusCircular: 25,
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        size: 22,
                        color: AppTheme.onBoardingLightGrey,
                      ),
                      hintTextSize: 16,
                      hintTextColor: AppTheme.hintColor,
                      filled: true,
                      filledColor: AppTheme.lightgrayColor,
                      onChanged: (value) {
                        _emailTextFieldValue = _emailController.text;
                        context.read<LoginUserBloc>().add(TextFieldTapped());
                      },
                      errorMessage: context.watch<LoginUserBloc>().emailErr,
                    ),
                    vSpace(30),
                    FilledButtonWidget(
                      text: getVerificationCode,
                      height: 55,
                      width: 360,
                      textColor: AppTheme.whiteColor,
                      borderRadiusCircular: 25,
                      paddingHorizontal: 0.007,
                      paddingVertical: 0.023,
                      textSize: 14,
                      onSubmit: () {
                        context.read<LoginUserBloc>().add(GetVerificationEvent(
                            LoginUserRequestModel(action: 'send', name: _emailController.text),
                            _emailController.text));
                      },
                    ),
                  ],
                ))))
          ]))),
    );
  }
}
