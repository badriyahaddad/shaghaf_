import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/artwork_provider.dart';
import 'package:shaghaf/widgets/static_widget/histroy_booking_card.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';

class HistoryBookingScreen extends StatefulWidget {
  const HistoryBookingScreen({super.key});

  @override
  State<HistoryBookingScreen> createState() => _HistoryBookingScreenState();
}

class _HistoryBookingScreenState extends State<HistoryBookingScreen> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes

    return Scaffold(body: SafeArea(child: SingleChildScrollView(child:
        Consumer<ArtworkProvider>(builder: (context, artworkListner, child) {
      return Column(
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
              itemCount: artworkListner.items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: HistroyBookingCard(
                    catagory: AppLocalizations.of(context)!.localeName == 'ar'
                        ? artworkListner.items[index].catagoryAr!
                        : artworkListner.items[index].catagoryEn!,
                    nameArtist: artworkListner.items[index].artistName!,
                    price: artworkListner.items[index].price,
                    image: artworkListner.items[index].image!,
                    headlineTitle: AppLocalizations.of(context)!.bookingartist,
                  ),
                );
              },
            ),
          ]);
    }))));
  }
}
