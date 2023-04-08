import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/static_widget/artworks_card.dart';
import '../../widgets/static_widget/coustom_appbar.dart';
import '../../widgets/static_widget/profile_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CostuomAppBar(
                  isOtherScreens: false,
                  isHome: true,
                  profileName: '',
                  title: AppLocalizations.of(context)!.profilescreenappbartitle,
                ),
              ),
              SizedBox(
                height: size.width / 1.2,
                width: size.width,
                child: const ProfileCard(
                  artistImage: "assets/person3.png",
                  artistName: "إيمان الورفلي",
                  workCatagory: "رسامة",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  AppLocalizations.of(context)!.detailsartitsworks,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const ArtWorkCard(
                hide: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
