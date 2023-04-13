import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/screens/auth_screen/sign_up.dart';
import '../../helpers/const.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/clikable_widgets/button.dart';
import '../../widgets/input_widget/text_field.dart';
import '../main_screens/bottom_navigation_bar.dart';

//what is it: when the user has already an account they just need to sign in into the app
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // controllers of the textfields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  //key form for the textfield
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              themeListener.isDark
                  ? "assets/auth_background_Dark.png"
                  : "assets/auth_background.png",
              fit: BoxFit.cover,
              width: size.width,
              height: size.width,
            ),
            //form that are assigned for textfield, so the user can enter thier data
            Form(
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
                            //welcome text
                            AppLocalizations.of(context)!.welcomelogintitle,
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
                            AppLocalizations.of(context)!.welcomeloginsubtitle,
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
                    //textfield email
                    TextFieldWidget(
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
                        if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]+.com")
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
                    //vertical space
                    SizedBox(
                      height: size.height / 70,
                    ),
                    //textfield password
                    TextFieldWidget(
                      isPassword: true,
                      prefix: Image.asset(themeListener.isDark
                          ? "assets/icons/passwordIcon_Dark.png"
                          : "assets/icons/passwordIcon.png"),
                      textFieldController: passwordController,
                      node: TextInputAction.done,
                      isVisable: false,
                      hintTxt: AppLocalizations.of(context)!.hintpassword,
                      keyboardType: TextInputType.visiblePassword,
                      validtion: (value) {
                        RegExp regExp = RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .validtionemptypassword;
                        }
                        if (!regExp.hasMatch(value)) {
                          return AppLocalizations.of(context)!
                              .validtioninvalidpassword;
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    //vertical space
                    SizedBox(
                      height: size.height / 35,
                    ),
                    //row of navigation to the other screen "Sign Up"
                    Row(
                      children: [
                        Text(
                          //you don't have an account text
                          AppLocalizations.of(context)!.loginmsgbutton,
                          style: TextStyle(
                              color: themeListener.isDark
                                  ? subTitleColorDark
                                  : subTitleColor,
                              fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            //Navigate to sign up to the system
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => const SignUp()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                                //sign up text
                                AppLocalizations.of(context)!.signupbutton,
                                style: TextStyle(
                                    color: themeListener.isDark
                                        ? mainColorDark
                                        : mainColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    //vertical space
                    SizedBox(
                      height: size.height / 30,
                    ),
                    //button to confirm loging in to the app
                    Button(
                        color: themeListener.isDark ? mainColorDark : mainColor,
                        screenWidth: size.width,
                        screenHieght: size.height * 0.061,
                        borderButton: false,
                        txt: AppLocalizations.of(context)!.loginmsgbuttonsec,
                        loading: false,
                        isActive: enableLoginBtn,
                        onClick: () {
                          if (formkey.currentState!.validate()) {
                            //pushReplacement: user cannot go back here after loggin in
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const BottomNavigationBarScreen()));
                            setState(() {
                              formkey.currentState!.save();
                            });
                          }
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
