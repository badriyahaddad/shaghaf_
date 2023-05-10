import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shaghaf/helpers/const.dart';
import '../../providers/artists_provider.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/input_widget/text_field.dart';
import '../../widgets/static_widget/settings_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<ArtistProvider>(context, listen: false)
          .loadArtistFromFirestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          size.height / 5,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height / 20,
              ),
              Text(
                AppLocalizations.of(context)!.search,
                style: TextStyle(
                    color: themeListener.isDark
                        ? titleTextColorDark
                        : titleTextColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Hero(
                tag: "textfiledwidgte",
                child: SafeArea(
                  child: TextFieldWidget(
                    enabled: true,
                    isDiscription: false,
                    isPassword: false,
                    prefix: Image.asset(themeListener.isDark
                        ? "assets/icons/serachIcon_Dark.png"
                        : "assets/icons/serachicon.png"),
                    textFieldController: searchController,
                    node: TextInputAction.search,
                    isVisable: false,
                    hintTxt: AppLocalizations.of(context)!.search,
                    keyboardType: TextInputType.visiblePassword,
                    validtion: (value) {},
                    obscureText: false,
                    search: (value) {
                      setState(() {
                        Provider.of<ArtistProvider>(context, listen: false)
                            .atistName = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Consumer<ArtistProvider>(builder: (context, artistConsumer, _) {
        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('artist').snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index].data()
                          as Map<String, dynamic>;
                      if (artistConsumer.items[index].artistName.isEmpty) {
                        return SettingsCard(
                          icon: Image.network(
                              artistConsumer.items[index].artistImage),
                          nextIcon: const Icon(Icons.navigate_next_rounded),
                          title: artistConsumer.items[index].artistName,
                          isLogOutCard: false,
                          iconBehavior: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (_) => const EditAccountDataScreen()));
                          },
                        );
                      }
                    },
                  );
          },
        );
      }),
    );
  }
}
