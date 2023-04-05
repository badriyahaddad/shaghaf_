import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shaghaf/screens/auth_screen/sign_up.dart';

import '../../helpers/const.dart';
import '../../widgets/clikable_widgets/button.dart';
import '../../widgets/input_widget/text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final nameController = TextEditingController();
  static final formkey = GlobalKey<FormState>();
  bool langDir = false;
  bool enableLoginBtn = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/auth_background.png",
              fit: BoxFit.cover,
              width: size.width,
              height: size.width,
            ),
            Form(
              key: formkey,
              onChanged: () {
                setState(() {
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
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            AppLocalizations.of(context)!.welcomelogintitle,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            AppLocalizations.of(context)!.welcomeloginsubtitle,
                            style: const TextStyle(
                                fontSize: 20, color: Color(0xff949494)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
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
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return AppLocalizations.of(context)!
                              .validtioninvalidemail;
                        }
                        return null;
                      },
                      obscureText: false,
                      prefix: Image.asset("assets/icons/emailIcon.png"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      isPassword: true,
                      prefix: Image.asset("assets/icons/passwordIcon.png"),
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
                    SizedBox(
                      height: size.height / 35,
                    ),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.loginmsgbutton,
                          style: const TextStyle(
                              color: Color(0xff949494), fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => const SignUp()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                                AppLocalizations.of(context)!.loginmsgbuttonsec,
                                style: TextStyle(
                                    color: buttomColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    Button(
                        screenWidth: size.width,
                        screenHieght: size.height * 0.061,
                        borderButton: false,
                        txt: AppLocalizations.of(context)!.loginmsgbuttonsec,
                        loading: false,
                        isActive: enableLoginBtn,
                        onClick: () {
                          if (formkey.currentState!.validate()) {
                            // Navigator.of(context).pushReplacement(
                            //     MaterialPageRoute(
                            //         builder: (_) => const HomeScreen()));
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
