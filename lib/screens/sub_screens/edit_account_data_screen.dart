import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/screens/auth_screen/forget_password.dart';
import 'package:shaghaf/screens/sub_screens/settings_screen.dart';
import '../../helpers/const.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/clikable_widgets/button.dart';
import '../../widgets/input_widget/text_field.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';
import '../../widgets/static_widget/settings_card.dart';

class EditAccountDataScreen extends StatefulWidget {
  const EditAccountDataScreen({super.key});

  @override
  State<EditAccountDataScreen> createState() => _EditAccountDataScreenState();
}

class _EditAccountDataScreenState extends State<EditAccountDataScreen> {
  // controllers of the textfields
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  //key form
  final formkey = GlobalKey<FormState>();

  //variable to preform the validate function to check wether the textfields values are valid or not!
  bool enableLoginBtn = false;
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
          SizedBox(
            height: size.height / 70,
          ),
          CostuomAppBar(
            menueFunction: () {},
            isDetails: false,
            isHome: false,
            profileName: '',
            title: AppLocalizations.of(context)!.editaccountdata,
            isOtherScreens: false,
            iconBehavior: () {
              Navigator.pop(context);
            },
            iconData: const Icon(Icons.arrow_back),
            subTitle: '',
          ),
          SizedBox(
            height: size.height / 15,
          ),
          Form(
            //form that are assigned for textfield, so the user can enter thier data
            key: formkey,
            onChanged: () {
              setState(() {
                //enableLoginBtn put in setState in onchange function so basically it listened to the changes of states of any of the textfields
                enableLoginBtn = formkey.currentState!.validate();
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Coulmn of welcome statments
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          //create your account text
                          AppLocalizations.of(context)!.changeyourdatatitle,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: themeListener.isDark
                                  ? titleTextColorDark
                                  : titleTextColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          // helper text
                          AppLocalizations.of(context)!.changeyourdatasubtitle,
                          style: TextStyle(
                              fontSize: 20,
                              color: themeListener.isDark
                                  ? subTitleColorDark
                                  : subTitleColor),
                        ),
                      ),
                    ],
                  ),
                  //vertical space
                  SizedBox(height: size.height / 70),
                  //textfield name
                  TextFieldWidget(
                    isDiscription: false,
                    prefix: Image.asset(themeListener.isDark
                        ? "assets/icons/nameIcon_Dark.png"
                        : "assets/icons/nameIcon.png"),
                    textFieldController: nameController,
                    node: TextInputAction.next,
                    isVisable: true,
                    hintTxt: AppLocalizations.of(context)!.hintname,
                    keyboardType: TextInputType.name,
                    validtion: (value) {
                      RegExp regExp = RegExp(r'^.{2,}$');
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.validtionemptyname;
                      }
                      if (!regExp.hasMatch(value)) {
                        return AppLocalizations.of(context)!
                            .validtioninvalidname;
                      }
                      return null;
                    },
                    obscureText: false,
                    isPassword: false,
                  ),
                  //vertical space
                  SizedBox(
                    height: size.height / 70,
                  ),
                  //textfield email
                  TextFieldWidget(
                    isDiscription: false,
                    isPassword: false,
                    textFieldController: emailController,
                    node: TextInputAction.next,
                    isVisable: false,
                    hintTxt: AppLocalizations.of(context)!.hintemail,
                    keyboardType: TextInputType.emailAddress,
                    validtion: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!
                            .validtionemptyemail;
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return AppLocalizations.of(context)!
                            .validtioninvalidemail;
                      }
                      return null;
                    },
                    obscureText: false,
                    prefix: Image.asset(themeListener.isDark
                        ? "assets/icons/emailIcon_Dark.png"
                        : "assets/icons/emailIcon.png"),
                  ),
                ],
              ),
            ),
          ),
          //vertical space
          SizedBox(
            height: size.height / 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SettingsCard(
              icon: Image.asset(themeListener.isDark
                  ? "assets/icons/passwordIcon_Dark.png"
                  : "assets/icons/passwordIcon.png"),
              nextIcon: const Icon(Icons.navigate_next_rounded),
              title: AppLocalizations.of(context)!.editpassword,
              isLogOutCard: false,
              iconBehavior: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const ForgetPassword()));
              },
            ),
          ),
          //vertical space
          SizedBox(
            height: size.height / 30,
          ),
          //button to confirm signing up to the system
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Button(
                color: themeListener.isDark ? mainColorDark : mainColor,
                screenWidth: size.width,
                screenHieght: size.height * 0.061,
                borderButton: false,
                txt: AppLocalizations.of(context)!.editbutton,
                loading: false,
                isActive: enableLoginBtn,
                onClick: () {
                  if (formkey.currentState!.validate()) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => const SettingScreen()));
                    setState(() {
                      formkey.currentState!.save();
                    });
                  }
                }),
          )
        ]))));
  }
}
