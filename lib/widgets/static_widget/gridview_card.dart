import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../clikable_widgets/icon_widget.dart';

class GridViewCard extends StatefulWidget {
  const GridViewCard({super.key, required this.index});
  final int index;

  @override
  State<GridViewCard> createState() => _GridViewCardState();
}

//Fake List
List fakeList = [
  {"image": "assets/artwork1.png", "name": "محمد الحداد", "catagory": "رسام"},
  {
    "image": "assets/artwork2.png",
    "name": "ايمان الورفلي",
    "catagory": "رسامة"
  },
  {"image": "assets/artwork3.png", "name": "نور محمد", "catagory": "خياطة"},
  {
    "image": "assets/artwork4.png",
    "name": "ايمن الحجازي",
    "catagory": "مصور فوتوغرافي"
  }
];

class _GridViewCardState extends State<GridViewCard> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(0, 0, 0, 0),
                    Color.fromARGB(103, 0, 0, 0),
                    Color.fromARGB(153, 0, 0, 0),
                    Color.fromARGB(232, 0, 0, 0)
                  ])),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              fakeList[widget.index]['image'],
              fit: BoxFit.cover,
              width: size.width / 1,
            ),
          ),
        ),
        Positioned(
          left: AppLocalizations.of(context)!.localeName == 'ar' ? 5 : 12,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconWidget(
              icon: isFav ? Icons.favorite : Icons.favorite_border,
              isAppbar: true,
              isFave: isFav,
              isSize: size.width / 15,
              onClick: () {
                setState(() {
                  isFav = !isFav;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
