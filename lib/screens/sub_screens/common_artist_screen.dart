import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shaghaf/screens/sub_screens/profile_artist_details_screen.dart';
import '../../widgets/static_widget/common_artist_card.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';

class CommonArtistScreen extends StatefulWidget {
  const CommonArtistScreen({super.key});

  @override
  State<CommonArtistScreen> createState() => _CommonArtistScreenState();
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

class _CommonArtistScreenState extends State<CommonArtistScreen> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CostuomAppBar(
              iconBehavior: () {
                Navigator.pop(context);
              },
              isDetails: false,
              isHome: false,
              profileName: '',
              title: AppLocalizations.of(context)!.homescreencommonartits,
              isOtherScreens: false,
              iconData: const Icon(
                Icons.arrow_back,
              ),
              subTitle: '',
            ),
          ),
          SizedBox(
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: GridView.builder(
                itemCount: fakeList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => ProfileArtistDetailsScreen(
                                artWorkImage: fakeList[index]["artistpic"],
                                artistName: fakeList[index]["name"],
                                workCatagory: fakeList[index]["catagory"],
                              )));
                    },
                    child: CommonArtistCard(
                      artistIamge: fakeList[index]["image"],
                      artistName: fakeList[index]["name"],
                      catagory: fakeList[index]["catagory"],
                      artistPic: fakeList[index]["artistpic"],
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
