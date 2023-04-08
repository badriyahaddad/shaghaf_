import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../helpers/const.dart';
import '../../screens/sub_screens/profile_artist_details_screen.dart';

class ArtistListCard extends StatefulWidget {
  const ArtistListCard({super.key});

  @override
  State<ArtistListCard> createState() => _ArtistListCardState();
}

//Fake List
List fakeList = [
  {"image": "assets/person1.png", "name": "نور محمد", "catagory": "خياطة"},
  {"image": "assets/person2.png", "name": "محمد الحداد", "catagory": "رسام"},
  {"image": "assets/person3.png", "name": "ايمان الورفلي", "catagory": "رسامة"},
  {
    "image": "assets/person4.png",
    "name": "ايمن الحجازي",
    "catagory": "مصور فوتوغرافي"
  },
];

class _ArtistListCardState extends State<ArtistListCard> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.homescreencommonartits,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalizations.of(context)!.more,
                style: TextStyle(fontSize: 18, color: mainColor),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height / 80,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            height: size.height / 9,
            width: size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: fakeList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ProfileArtistDetailsScreen(
                              artistImage: fakeList[index]["image"],
                              artistName: fakeList[index]["name"],
                              workCatagory: fakeList[index]["catagory"],
                            )));
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    maxRadius: 50,
                    child: Image.asset(
                      fakeList[index]["image"],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
