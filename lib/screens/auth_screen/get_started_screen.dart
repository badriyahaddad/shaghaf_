import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helpers/const.dart';
import '../../widgets/clikable_widgets/button.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Container(
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
              Positioned(
                top: 600,
                right: 2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
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
                        AppLocalizations.of(context)!.getstartedsubtitle,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Button(
                        color: welcomeButtomColor,
                        isActive: true,
                        borderButton: false,
                        loading: false,
                        onClick: () {},
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
