import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/models/cart_model.dart';

import '../../helpers/const.dart';
import '../../providers/cart_provider.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/static_widget/cart_card.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

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
    for (var item
        in Provider.of<CartProvider>(context, listen: false).cartList) {
      if (countMap.containsKey(item)) {
        countMap[item] += 1;
      } else {
        countMap[item] = 1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<CartModel> uniqueItems =
        Provider.of<CartProvider>(context, listen: false)
            .cartList
            .toSet()
            .toList();

    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    final cartListener = Provider.of<CartProvider>(context, listen: false);

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
                          menueFunction: () {},
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
                              " ${cartListener.cartList.length} ${AppLocalizations.of(context)!.item}",
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
                            cartListener.cartList.isEmpty
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
                                      int count = countMap[item] ?? 0;

                                      return CartCard(
                                        producTitle:
                                            AppLocalizations.of(context)!
                                                        .localeName ==
                                                    'ar'
                                                ? uniqueItems[index].titleAr
                                                : uniqueItems[index].titleEn,
                                        productImage: uniqueItems[index].image,
                                        productPrice: uniqueItems[index].price,
                                        productSubTitle:
                                            AppLocalizations.of(context)!
                                                        .localeName ==
                                                    'ar'
                                                ? uniqueItems[index].catagoryAr
                                                : uniqueItems[index].catagoryEn,
                                        noOfDoublecated: count,
                                        minusIconBehavier: () {
                                          setState(() {
                                            uniqueItems[index].price -=
                                                item.price;
                                          });
                                        },
                                        plusIconBehavier: () {
                                          setState(() {
                                            // cartListener.cartList[index].price *

                                            uniqueItems[index].price +=
                                                item.price;
                                          });
                                        },
                                      );
                                    },
                                  )
                          ],
                        ),
                      )
                    ]))));
  }
}
