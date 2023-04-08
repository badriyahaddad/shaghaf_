import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helpers/const.dart';
import '../../widgets/clikable_widgets/button.dart';
import 'log_in.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //for the background color
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffFAFAE0),
              Color(0xff9F9169),
              Color(0xff534621),
              Color(0xff534621),
            ]),
      ),
      child: Scaffold(
        //so the background color from line from 19 to 31 can displayed
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Container(
                //background in front of the image so the text can displayed
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(0, 124, 112, 80),
                        Color.fromARGB(0, 124, 112, 80),
                        Color.fromARGB(132, 124, 112, 80),
                        Color.fromARGB(125, 83, 70, 33),
                      ]),
                ),
                child: Image.asset(
                  "assets/getstarted_background.png",
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
                    //vertical space
                    SizedBox(
                      height: size.height / 20,
                    ),
                    //button to Navigate to the app other screens
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Button(
                        color: welcomeButtomColor,
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
