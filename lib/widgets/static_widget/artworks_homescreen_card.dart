import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/theme_provider.dart';
import '../../helpers/const.dart';
import '../../screens/sub_screens/artwork_details_screen.dart';
import '../../screens/sub_screens/common_artwork_screen.dart';
import 'gridview_card.dart';

class ArtWorkCard extends StatefulWidget {
  const ArtWorkCard({super.key, required this.hide});
  final bool hide;

  @override
  State<ArtWorkCard> createState() => _ArtWorkCardState();
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

class _ArtWorkCardState extends State<ArtWorkCard> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: widget.hide
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.homescreencommonart,
                        style: TextStyle(
                            color: themeListener.isDark
                                ? titleTextColorDark
                                : titleTextColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const CommonArtWorkScreen()));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.more,
                          style: TextStyle(
                              fontSize: 18,
                              color: themeListener.isDark
                                  ? mainColorDark
                                  : mainColor),
                        ),
                      ),
                    ],
                  )
                : null),
        SizedBox(
          height: size.height / 70,
        ),
        SizedBox(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: MasonryGridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: fakeList.length,
              crossAxisCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ArtWorkDetailsScreen(
                              artistIamge: fakeList[index]["image"],
                              artistName: fakeList[index]["name"],
                              catagory: fakeList[index]["catagory"],
                              artistPic: fakeList[index]["artistpic"],
                            )));
                  },
                  child: GridViewCard(
                    index: index,
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
