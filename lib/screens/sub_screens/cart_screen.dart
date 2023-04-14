import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../helpers/const.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/static_widget/cart_card.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.cartList});
  final List cartList;
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final countMap = {};
  @override
  void initState() {
    super.initState();
    _generateCountMap();
  }

  void _generateCountMap() {
    for (var item in widget.cartList) {
      if (countMap.containsKey(item)) {
        countMap[item] += 1;
      } else {
        countMap[item] = 1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List uniqueItems = widget.cartList.toSet().toList();
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: CostuomAppBar(
                          isDetails: false,
                          isHome: false,
                          profileName: '',
                          title: AppLocalizations.of(context)!.cartscreentitle,
                          isOtherScreens: false,
                          iconBehavior: () {
                            Navigator.pop(context);
                          },
                          iconData: const Icon(Icons.arrow_back),
                          subTitle: '',
                        ),
                      ),
                      SizedBox(
                        height: size.height / 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.cartscreentitle,
                              style: TextStyle(
                                  color: themeListener.isDark
                                      ? titleTextColorDark
                                      : titleTextColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " ${widget.cartList.length} ${AppLocalizations.of(context)!.item}",
                              style: TextStyle(
                                color: themeListener.isDark
                                    ? subTitleColorDark
                                    : subTitleColor,
                                fontSize: 20,
                              ),
                            ),
                            Divider(
                              color: themeListener.isDark
                                  ? subTitleColorDark
                                  : subTitleColor,
                              thickness: 1,
                              height: 20,
                            ),
                            widget.cartList.isEmpty
                                ? Text(
                                    AppLocalizations.of(context)!.cartisempty,
                                    style: TextStyle(
                                      color: themeListener.isDark
                                          ? subTitleColorDark
                                          : subTitleColor,
                                      fontSize: 20,
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: uniqueItems.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final item = uniqueItems[index];
                                      final count = countMap[item] ?? 0;
                                      return CartCard(
                                        producTitle: uniqueItems[index]
                                            ['producttitle'],
                                        productImage: uniqueItems[index]
                                            ['productimage'],
                                        productPrice: uniqueItems[index]
                                            ['productprice'],
                                        productSubTitle: uniqueItems[index]
                                            ['productcatagory'],
                                        noOfDoublecated: count,
                                      );
                                    },
                                  )
                          ],
                        ),
                      )
                    ]))));
  }
}
