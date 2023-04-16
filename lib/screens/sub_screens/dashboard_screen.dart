import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/helpers/const.dart';
import 'package:shaghaf/providers/theme_provider.dart';
import 'package:shaghaf/widgets/static_widget/dashbord_card.dart';
import '../../widgets/clikable_widgets/floatingaction_button.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

//Fake List
List fakeList = [
  {
    "image": "assets/artwork1.png",
    "name": "محمد الحداد",
    "catagory": "رسام",
    "artistpic": "assets/person2.png",
  },
  {
    "image": "assets/artwork2.png",
    "name": "ايمان الورفلي",
    "catagory": "رسامة",
    "artistpic": "assets/person3.png",
  },
  {
    "image": "assets/artwork3.png",
    "name": "نور محمد",
    "catagory": "خياطة",
    "artistpic": "assets/person1.png",
  },
  {
    "image": "assets/artwork4.png",
    "name": "ايمن الحجازي",
    "catagory": "مصور فوتوغرافي",
    "artistpic": "assets/person4.png",
  }
];

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
        floatingActionButton: const FloatingButton(),
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
                title: AppLocalizations.of(context)!.dashbord,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  " ${AppLocalizations.of(context)!.postno} ${fakeList.length}",
                  style: TextStyle(
                      color: themeListener.isDark
                          ? titleTextColorDark
                          : titleTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: size.height / 60,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: fakeList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    child: DashboardCard(
                      discription: AppLocalizations.of(context)!.loremipsum,
                      catagory: fakeList[index]['catagory'],
                      image: fakeList[index]['image'],
                      price: '150',
                      deleteFunction: () {},
                      editFunction: () {},
                    ),
                  );
                },
              ),
            ]))));
  }
}
