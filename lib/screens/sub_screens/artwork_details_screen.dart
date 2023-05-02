import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/static_widget/artwork_details_card.dart';
import '../../widgets/static_widget/artwork_details_image_card.dart';

class ArtWorkDetailsScreen extends StatefulWidget {
  const ArtWorkDetailsScreen(
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
  State<ArtWorkDetailsScreen> createState() => _ArtWorkDetailsScreenState();
}

class _ArtWorkDetailsScreenState extends State<ArtWorkDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
      backgroundColor:
          themeListener.isDark ? Colors.grey.shade900 : Colors.grey.shade100,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            ArtworkDetailsImageCard(
              artistIamge: widget.artistIamge,
              artistName: widget.artistName,
              artistPic: widget.artistPic,
              catagory: widget.catagory,
            ),
            Positioned.fill(
              child: SizedBox(
                  child: Container(
                alignment: Alignment.bottomCenter,
                child: ArtworkDetailsCard(
                  artistIamge: widget.artistIamge,
                  artistName: widget.artistName,
                  artistPic: widget.artistIamge,
                  catagory: widget.catagory,
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
