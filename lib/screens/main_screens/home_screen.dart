import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/artists_provider.dart';
import 'package:shaghaf/providers/artwork_provider.dart';

import '../../widgets/static_widget/artist_list_homescreen_card.dart';
import '../../widgets/static_widget/artworks_homescreen_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<ArtistProvider>(context, listen: false)
        .loadArtistFromFirestore();
    Provider.of<ArtworkProvider>(context, listen: false)
        .loadArtWorkItemsFromFirestore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: size.height / 30,
            ),
            const ArtistListCard(),
            SizedBox(
              height: size.height / 30,
            ),
            const ArtWorkCard(
              hide: true,
            )
          ],
        ),
      ),
    );
  }
}
