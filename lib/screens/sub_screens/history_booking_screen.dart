import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shaghaf/widgets/static_widget/histroy_booking_card.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';

class HistoryBookingScreen extends StatefulWidget {
  const HistoryBookingScreen({super.key});

  @override
  State<HistoryBookingScreen> createState() => _HistoryBookingScreenState();
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

class _HistoryBookingScreenState extends State<HistoryBookingScreen> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes

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
            title: AppLocalizations.of(context)!.booking,
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
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: fakeList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: HistroyBookingCard(
                  catagory: fakeList[index]['catagory'],
                  nameArtist: fakeList[index]['name'],
                  price: '150',
                  image: fakeList[index]['image'],
                  headlineTitle: AppLocalizations.of(context)!.bookingartist,
                ),
              );
            },
          ),
        ]))));
  }
}
