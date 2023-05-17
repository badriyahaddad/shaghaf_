import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/history_provider.dart';
import 'package:shaghaf/widgets/static_widget/histroy_booking_card.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';

class HistoryBookingScreen extends StatefulWidget {
  const HistoryBookingScreen({super.key});

  @override
  State<HistoryBookingScreen> createState() => _HistoryBookingScreenState();
}

class _HistoryBookingScreenState extends State<HistoryBookingScreen> {
  @override
  void initState() {
    Provider.of<HistoryProvider>(context, listen: false)
        .loadHistorytemsFromFirestore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;

    return Scaffold(body: SafeArea(child: SingleChildScrollView(child:
        Consumer<HistoryProvider>(builder: (context, historyListner, child) {
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
              itemCount: historyListner.items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: HistroyBookingCard(
                    catagory: AppLocalizations.of(context)!.localeName == 'ar'
                        ? historyListner.items[index].catagoryAr!
                        : historyListner.items[index].catagoryEn!,
                    nameArtist: historyListner.items[index].artistName!,
                    price: historyListner.items[index].price.toString(),
                    image: historyListner.items[index].image!,
                    headlineTitle: AppLocalizations.of(context)!.bookingartist,
                  ),
                );
              },
            ),
          ]);
    }))));
  }
}
