import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shaghaf/screens/auth_screen/reset_password_screen.dart';
import '../../helpers/const.dart';
import '../../widgets/clikable_widgets/button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // controllers of the textfields
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height / 15),
            Center(child: Image.asset("assets/otp.png")),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //vertical space
                  SizedBox(height: size.height / 8),
                  Text(
                    AppLocalizations.of(context)!.otptitle,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    AppLocalizations.of(context)!.otpsubtitle,
                    style:
                        const TextStyle(fontSize: 20, color: Color(0xff949494)),
                  ),
                ],
              ),
            ),
            //vertical space
            SizedBox(height: size.height / 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PinCodeTextField(
                appContext: context,
                enableActiveFill: true,
                cursorColor: mainColor,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                pinTheme: PinTheme(
                  activeColor: mainColor,
                  activeFillColor: mainColor.withOpacity(0.2),
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(16),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  borderWidth: 0.9,
                  inactiveColor: Colors.grey,
                  selectedFillColor: const Color.fromARGB(54, 158, 158, 158),
                  inactiveFillColor: const Color.fromARGB(0, 255, 255, 255),
                  disabledColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                animationType: AnimationType.fade,
                pastedTextStyle: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.bold,
                ),
                length: 4,
                onChanged: (String value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Text(
                    //you don't have an account text
                    AppLocalizations.of(context)!.otphelpertextone,
                    style:
                        const TextStyle(color: Color(0xff949494), fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                          //sign up text
                          AppLocalizations.of(context)!.otphelpertexttwo,
                          style: TextStyle(
                              color: buttomColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            //vertical space
            SizedBox(height: size.height / 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Button(
                color: mainColor,
                isActive: true,
                borderButton: false,
                loading: false,
                onClick: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => const ResetPasswordScreen()));
                },
                screenHieght: size.height / 15,
                screenWidth: size.width / 1.1,
                txt: AppLocalizations.of(context)!.nextbutton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
