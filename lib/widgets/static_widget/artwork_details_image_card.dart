import 'package:flutter/material.dart';
import 'coustom_appbar_widget.dart';

class ArtworkDetailsImageCard extends StatefulWidget {
  const ArtworkDetailsImageCard(
      {super.key,
      required this.artistName,
      required this.artistIamge,
      required this.catagory,
      required this.artistPic});
  final String artistName;
  final String artistIamge;
  final String catagory;
  final String artistPic;
  @override
  State<ArtworkDetailsImageCard> createState() =>
      _ArtworkDetailsImageCardState();
}

class _ArtworkDetailsImageCardState extends State<ArtworkDetailsImageCard> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          widget.artistIamge,
          width: size.width,
          // height: size.height,
          fit: BoxFit.contain,
        ),
        Container(
          width: size.width,
          height: size.width / 2,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromARGB(232, 0, 0, 0),
                Color.fromARGB(153, 0, 0, 0),
                Color.fromARGB(103, 0, 0, 0),
                Color.fromARGB(0, 0, 0, 0),
              ])),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: CostuomAppBar(
            menueFunction: () {},
            iconData: const Icon(Icons.arrow_back),
            isDetails: true,
            isHome: false,
            isOtherScreens: true,
            profileName: '',
            subTitle: widget.catagory,
            title: widget.artistName,
            iconBehavior: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
