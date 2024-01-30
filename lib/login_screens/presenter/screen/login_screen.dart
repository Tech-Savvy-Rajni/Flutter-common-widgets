import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../common/validator.dart';
import '../../../utils/common_widgets/buttons/filled_button_widget.dart';
import '../../../utils/common_widgets/common.dart';
import '../../../utils/common_widgets/dropdown/dropdown_widget.dart';
import '../../../utils/common_widgets/otp_pin_fields_widget.dart';
import '../../../utils/common_widgets/tabbar_widget.dart';
import '../../../utils/common_widgets/tabledata/table_data_widget.dart';
import '../../../utils/common_widgets/text_widget.dart';
import '../../../utils/common_widgets/textformfield/hint_textformfield_widget.dart';
import '../../../utils/common_widgets/textformfield/label_textformfield_widget.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_theme.dart';
import '../../../utils/constants/strings.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  late TabController _tabController;

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var tableHeader = [
    {'title': 'Id', 'sort': false},
    {'title': 'Name', 'sort': true},
    {'title': 'Email Id', 'sort': true},
    {'title': 'Change Password', 'sort': false},
    {'title': 'Send Mail', 'sort': false},
    {'title': 'Action', 'sort': false},
  ];
  var tableHeader1 = [
    {'title': 'Name', 'sort': true},
    {'title': 'Email Id', 'sort': true},
    {'title': 'Action', 'sort': false},
  ];
  var tableData = [
    {
      'Id': 213,
      'Name': 'shayama',
      'Email Id': 'shyama@keyess.in',
      'Change Password': '1234567',
      'Send Mail': 'sdsdsd',
      'Action': 'action'
    },
    {
      'Id': 214,
      'Name': 'shyam',
      'Email Id': 'shyam@keyess.in',
      'Change Password': '8709897788',
      'Send Mail': 'kkkkkk',
      'Action': 'action'
    },
    {
      'Id': 211,
      'Name': 'rajni',
      'Email Id': 'rajni@keyess.in',
      'Change Password': '1234',
      'Send Mail': '123',
      'Action': 'action'
    },
  ];
  List<Map<String, String>> testClientData = [
    {
      'Name': 'Test user ',
      'Email Id': 'testUser@keyss.in',
      'action': "Activate"
    },
    {
      'Name': 'Pushpender Singh Kumar',
      'Email Id': 'pushpender@keyss.in',
      'action': "Activate"
    },
    {
      'Name': 'Partiksha',
      'Email Id': 'partiksha@keyss.in',
      'action': "Activate"
    },
  ];
  var enterYourEmail1 = '';
  static const List<Tab> tabs = [
    const Tab(icon: Icon(Icons.looks_one), child: const Text('Tab One')),
    const Tab(icon: Icon(Icons.looks_two), text: 'Tab Two'),
    const Tab(icon: Icon(Icons.looks_3), text: 'Tab Three'),
  ];

  static const List<Widget> views = [
    const Center(child: const Text('Content of Tab One')),
    const Center(child: const Text('Content of Tab Two')),
    const Center(child: const Text('Content of Tab Three')),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.animateTo(2);
    // context.read<LoginBloc>().add(LoadInitialData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
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
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      // if (state is LoginLoaded) {
      return RefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

               vSpace(40),
                OtpPinFieldsWidget(
                  fieldHeight: 57,
                  fieldWidth: 57,
                  maxlength: 4,
                    validaErrMsg:null
                ),
               vSpace(40),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.90,
                    child: Center(
                        //SCROLL THROUGH THE ENTIRE PAGE
                        child: SingleChildScrollView(
                            child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //LOGO
                        SizedBox(
                          height: 160,
                          width: 160,
                          child: Image.asset(logo),
                        ),
                         vSpace(15),
                        //TABBAR WIDGET
                        TabBarWidget(
                          tabs: tabs,
                          views: views,
                          tabController: _tabController,
                          height: 200,
                          width: 300,
                        ),
                        vSpace(15),
                        //SIMPLE BOLD TEXTWIDGET
                        const TextWidget(
                          signInToKEYSS,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: proximaNova,
                              color: AppTheme.headingtextBlackColor,
                              fontWeight: FontWeight.w600),
                        ),
                        // //SIMPLE MEDIUM TEXTWIDGET
                        const TextWidget(
                          didNotReceiveCode,
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: proximaNova,
                              color: AppTheme.hintColor,
                              fontWeight: FontWeight.w500),
                        ),
                        //TEXTWIDGET WITH CLICK EVENT
                        TextWidget('Resend',
                            style: const TextStyle(
                                fontSize: 18,
                                fontFamily: proximaNova,
                                color: AppTheme.btnOrange,
                                fontWeight: FontWeight.w500), onTap: () {
                          print("hahah");
                        }),
                        vSpace(28),
                        //TEXTFORMFIED WITH PREFIX ICON
                        HintTextFormFieldWidget(
                          formKey: _formKey,
                          hintText: "Enter your first name",
                          controller: _firstNameController,
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
                            context.read<LoginBloc>().add(
                                LoginInTextChangeEvent(
                                    _firstNameController.text,
                                    _lastNameController.text,
                                    _emailController.text,
                                    'firstname'));
                          },
                          errorMessage:
                              context.watch<LoginBloc>().firstNameErrorMesssage,
                        ),
                        vSpace(10),
                        //  circularProgressIndicator(),
                        vSpace(10),

                        LabelTextFormFieldWidget(
                          controller: _lastNameController,
                          hintText: "Enter your last name",
                          errorMessage:
                              context.watch<LoginBloc>().lastNameErrorMesssage,
                          onChanged: (value) {
                            // enterYourEmail1 = value;

                            context.read<LoginBloc>().add(
                                LoginInTextChangeEvent(
                                    _firstNameController.text,
                                    _lastNameController.text,
                                    _emailController.text,
                                    'lastname'));
                          },
                        ),
                        vSpace(10),
                        LabelTextFormFieldWidget(
                          controller: _emailController,
                          hintText: enterYourEmail,
                          errorMessage:
                              context.watch<LoginBloc>().emailErrorMessage,
                          onChanged: (value) {
                            context.read<LoginBloc>().add(
                                LoginInTextChangeEvent(
                                    _firstNameController.text,
                                    _lastNameController.text,
                                    _emailController.text,
                                    'email'));
                          },
                        ),
                        //TEXTFORMFIELD WITH SUFFIX ICON AND BORDER
                        Padding(
                          padding: const EdgeInsets.only(left: 80.0, right: 50),
                          child: HintTextFormFieldWidget(
                            hintText: '09:00',
                            controller: _emailController,
                            borderRadiusCircular: 5,
                            suffixIcon: const Icon(
                              Icons.email_outlined,
                              size: 22,
                              color: AppTheme.onBoardingLightGrey,
                            ),
                            hintTextSize: 16,
                            hintTextColor: AppTheme.hintColor,
                            filled: false,
                          ),
                        ),
                        vSpace(10),
                        // SIMPLE DROPDOWN LIST
                        DropDownWidget(
                            items: items,
                            hintText: 'Select your project',
                            hintTextSize: 16,
                            hintTextColor: AppTheme.onBoardingLightGrey,
                            itemTextSize: 16,
                            buttonStyleDataHeight: 45,
                            buttonStyleDataWidth: 300,
                            menuItemStyleDataHeight: 40),
                        vSpace(10),
                        //ROUND BUTTON DOUBLE TEXTURE

                        FilledButtonWidget(
                          text: getVerificationCode,
                          leftGradientColor: (state is LoginValidState)
                              ? AppTheme.btnOrange1
                              : AppTheme.onBoardingMediumGrey,
                          rightGradientColor: (state is LoginValidState)
                              ? AppTheme.btnOrange
                              : AppTheme.onBoardingMediumGrey,
                          borderColor: (state is LoginValidState)? AppTheme.btnOrange : AppTheme.onBoardingMediumGrey,
                          height: 55,
                          width: 360,
                          textColor: AppTheme.whiteColor,
                          borderRadiusCircular: 25,
                          paddingHorizontal: 0.007,
                          paddingVertical: 0.023,
                          textSize: 14,
                          onSubmit: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                customSnackBar(
                                    content: "Hello how are u!!",
                                    bcolor: AppTheme.greenColor,
                                    elevation: 10,
                                    behavior: SnackBarBehavior.floating,
                                    margin: 10));

                            if (state is LoginValidState) {
                              context.read<LoginBloc>().add(LoginSubmittedEvent(
                                  _firstNameController.text,
                                  _lastNameController.text,
                                  _emailController.text));
                            }
                          },
                        ),
                        vSpace(20),
                        //CORNER ROUND BUTTON DOUBLE TEXTURE
                        FilledButtonWidget(
                          text: logout,
                          height: 42,
                          width: 132,
                          textColor: AppTheme.whiteColor,
                          borderRadiusCircular: 10,
                          textSize: 16,
                          paddingHorizontal: 0.010,
                          paddingVertical: 0.015,
                          onSubmit: () async {
                            // await EasyLoading.show(
                            //   status: 'loading...',
                            //   maskType: EasyLoadingMaskType.black,
                            // );

                            print('EasyLoading show');
                          },
                        ),
                        vSpace(20),
                        // CORNER ROUND BUTTON WHITE BACKGROUND
                        FilledButtonWidget(
                          leftGradientColor: AppTheme.whiteColor,
                          rightGradientColor: AppTheme.whiteColor,
                          text: cancel,
                          height: 42,
                          width: 132,
                          textColor: AppTheme.btnOrange,
                          borderRadiusCircular: 10,
                          textSize: 16,
                          paddingHorizontal: 0.010,
                          paddingVertical: 0.015,
                          onSubmit: () {},
                        ),

                        // TABLE WIDGET WITH 6 COLUMN
                        TableDataWidget(
                            tableHeader: tableHeader,
                            tableData: tableData,
                            tableColumnWidth: 130,
                            tableRowHeight: 40,
                            borderRadius: 8,
                            borderColor: AppTheme.hintColor,
                            dividerColor: AppTheme.onBoardingGrey,
                            tabledataColor: AppTheme.onBoardingMediumGrey,
                            headerColor: AppTheme.greyBoxColor),

                        // TABLE WIDGET WITH 3 COLUMN
                        TableDataWidget(
                          tableHeader: tableHeader1,
                          tableData: testClientData,
                          tableColumnWidth: 130,
                          tableRowHeight: 50,
                          borderRadius: 8,
                          borderColor: AppTheme.hintColor,
                          dividerColor: AppTheme.onBoardingGrey,
                          tabledataColor: AppTheme.onBoardingMediumGrey,
                          headerColor: AppTheme.greyBoxColor,
                          cardColor: AppTheme.whiteColor,
                        ),
                      ],
                    ))))
              ])));
      // } else {
      //    return Container();
      //  }
    });
  }

  //Login form to display enter OTP form
  Widget OTPForm() {
    return Text("OTP form");
  }
}
