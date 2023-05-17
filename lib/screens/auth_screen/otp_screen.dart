// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:provider/provider.dart';
// import 'package:shaghaf/providers/theme_provider.dart';
// import 'package:shaghaf/screens/auth_screen/reset_password_screen.dart';
// import '../../helpers/const.dart';
// import '../../widgets/clikable_widgets/button.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// //what is it: to confirm the password change
// class OtpScreen extends StatefulWidget {
//   const OtpScreen({super.key});

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   // controllers of the textfields
//   final emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     //MediaQuery for more responsive UI
//     Size size = MediaQuery.of(context).size;
//     //dark theme mode to listen to the changes when the mode it's changes
//     final themeListener = Provider.of<ThemeProvider>(context, listen: true);
//     return Scaffold(
//       //this appbar allows the user to navigate back to the previous screen, through pushReplacement !
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: size.height / 15),
//             Center(
//                 child: Image.asset(
//               themeListener.isDark ? "assets/otp_dark.png" : "assets/otp.png",
//               width: size.width / 3,
//             )),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   //vertical space
//                   SizedBox(height: size.height / 8),
//                   Text(
//                     AppLocalizations.of(context)!.otptitle,
//                     style: TextStyle(
//                         color: themeListener.isDark
//                             ? titleTextColorDark
//                             : titleTextColor,
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     AppLocalizations.of(context)!.otpsubtitle,
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: themeListener.isDark
//                           ? subTitleColorDark
//                           : subTitleColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             //vertical space
//             SizedBox(height: size.height / 20),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: PinCodeTextField(
//                 appContext: context,
//                 enableActiveFill: true,
//                 cursorColor: themeListener.isDark ? mainColorDark : mainColor,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 pinTheme: PinTheme(
//                   activeColor: themeListener.isDark ? mainColorDark : mainColor,
//                   activeFillColor: themeListener.isDark
//                       ? mainColorDark.withOpacity(0.2)
//                       : mainColor.withOpacity(0.2),
//                   shape: PinCodeFieldShape.box,
//                   borderRadius: BorderRadius.circular(16),
//                   fieldHeight: 50,
//                   fieldWidth: 50,
//                   borderWidth: 0.9,
//                   inactiveColor:
//                       themeListener.isDark ? subTitleColorDark : subTitleColor,
//                   selectedFillColor: themeListener.isDark
//                       ? subTitleColorDark.withOpacity(0.2)
//                       : subTitleColor.withOpacity(0.2),
//                   inactiveFillColor: const Color.fromARGB(0, 255, 255, 255),
//                   disabledColor: const Color.fromARGB(255, 255, 255, 255),
//                 ),
//                 animationType: AnimationType.fade,
//                 pastedTextStyle: TextStyle(
//                   color: themeListener.isDark ? mainColorDark : mainColor,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 length: 4,
//                 onChanged: (String value) {},
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Row(
//                 children: [
//                   Text(
//                     //you don't have an account text
//                     AppLocalizations.of(context)!.otphelpertextone,
//                     style: TextStyle(
//                         color: themeListener.isDark
//                             ? subTitleColorDark
//                             : subTitleColor,
//                         fontSize: 20),
//                   ),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Text(
//                           //sign up text
//                           AppLocalizations.of(context)!.otphelpertexttwo,
//                           style: TextStyle(
//                               color: themeListener.isDark
//                                   ? mainColorDark
//                                   : mainColor,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             //vertical space
//             SizedBox(height: size.height / 6),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Button(
//                 color: themeListener.isDark ? mainColorDark : mainColor,
//                 isActive: true,
//                 borderButton: false,
//                 loading: false,
//                 onClick: () {
//                   Navigator.of(context).pushReplacement(MaterialPageRoute(
//                       builder: (_) => const ResetPasswordScreen()));
//                 },
//                 screenHieght: size.height / 15,
//                 screenWidth: size.width / 1.1,
//                 txt: AppLocalizations.of(context)!.nextbutton,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
