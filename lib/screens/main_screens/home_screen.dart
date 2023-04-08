import 'package:flutter/material.dart';
import '../../widgets/static_widget/artist_list_card.dart';
import '../../widgets/static_widget/artworks_card.dart';
import '../../widgets/static_widget/coustom_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: size.height / 70,
              ),
              CostuomAppBar(
                isOtherScreens: true,
                profileName: 'احمد',
                isHome: true,
                title: AppLocalizations.of(context)!.homescreenappbartitle,
              ),
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
      ),
    );
  }
}
