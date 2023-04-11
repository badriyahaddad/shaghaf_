import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../helpers/const.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/clikable_widgets/button.dart';
import 'log_in.dart';

//what is it: this screen is the first active screen after splach screen so the user begin
class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    final themeFunction = Provider.of<ThemeProvider>(context, listen: false);
    return Container(
      //for the background color
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              themeListener.isDark
                  ? const Color(0xff242424)
                  : const Color(0xffFAFAE0),
              themeListener.isDark
                  ? const Color(0xff242424)
                  : const Color(0xff9F9169),
              themeListener.isDark
                  ? const Color(0xff242424)
                  : const Color(0xff534621),
              themeListener.isDark
                  ? const Color(0xff242424)
                  : const Color(0xff534621),
            ]),
      ),
      child: Scaffold(
        //so the background color underneath from line 19 to 31 can displayed
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Container(
                //background in front of the image so the text can displayed
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        themeListener.isDark
                            ? const Color.fromRGBO(36, 36, 36, 0)
                            : const Color.fromARGB(0, 124, 112, 80),
                        themeListener.isDark
                            ? const Color.fromRGBO(36, 36, 36, 0.65)
                            : const Color.fromARGB(0, 124, 112, 80),
                        themeListener.isDark
                            ? const Color.fromRGBO(36, 36, 36, 0.78)
                            : const Color.fromARGB(132, 124, 112, 80),
                        themeListener.isDark
                            ? const Color.fromRGBO(36, 36, 36, 1)
                            : const Color.fromARGB(125, 83, 70, 33),
                      ]),
                ),
                child: Image.asset(
                  themeListener.isDark
                      ? "assets/get_started_dark_mode.png"
                      : "assets/getstarted_background.png",
                  fit: BoxFit.cover,
                  width: size.width / 0.7,
                  height: size.height / 1.3,
                ),
              ),
              //postion of the widgets
              Positioned(
                top: 600,
                right: 2,
                //coulmn of the welcoming texts
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        //find your favirote artist text
                        AppLocalizations.of(context)!.getstartedtitle,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        //helper text
                        AppLocalizations.of(context)!.getstartedsubtitle,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.dark_mode,
                          color: themeListener.isDark
                              ? Colors.red
                              : Colors.purple),
                      onPressed: () {
                        themeFunction.switchMode();
                      },
                    ),
                    //vertical space
                    SizedBox(
                      height: size.height / 30,
                    ),
                    //button to Navigate to the app other screens
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Button(
                        color: themeListener.isDark
                            ? welcomeButtonColorDark
                            : welcomeButtonColor,
                        isActive: true,
                        borderButton: false,
                        loading: false,
                        onClick: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => const Login()));
                        },
                        screenHieght: size.height / 14,
                        screenWidth: size.width / 1.1,
                        txt: AppLocalizations.of(context)!.getstartbuttom,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
