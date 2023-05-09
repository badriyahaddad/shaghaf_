import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shaghaf/providers/filter_provider.dart';
import '../../helpers/const.dart';
import '../../models/filter_model.dart';
import '../../providers/theme_provider.dart';

class DropDownMenueWidget extends StatefulWidget {
  const DropDownMenueWidget({Key? key, required this.items}) : super(key: key);
  final List<FilterModel> items;
  @override
  State<DropDownMenueWidget> createState() => _DropDownMenueWidgetState();
}

class _DropDownMenueWidgetState extends State<DropDownMenueWidget> {
  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    final filterListener = Provider.of<FilterProvider>(context, listen: true);
    final filterFunctions = Provider.of<FilterProvider>(context, listen: false);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: themeListener.isDark
                ? mainColorDark
                : mainColor.withOpacity(0.5)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<FilterModel>(
          value: filterListener.selectedItem,
          hint: Center(
              child: Text(
            filterListener.selectedItem == null
                ? AppLocalizations.of(context)!.dropdownvalue
                : filterListener.selectedItem!.catagoryEn,
          )),
          isExpanded: true,
          iconSize: 30,
          icon: Icon(
            Icons.arrow_drop_down,
            color: themeListener.isDark ? mainColorDark : mainColor,
          ),
          items: widget.items.map(buildmenueItem).toList(),
          onChanged: (value) {
            // setState(() {
            //   selectedItem = value;
            // });
            filterFunctions.setSelectedItem(value!);
          },
        ),
      ),
    );
  }

  DropdownMenuItem<FilterModel> buildmenueItem(FilterModel item) =>
      DropdownMenuItem(
        value: item,
        child: Text(
          AppLocalizations.of(context)!.localeName == 'ar'
              ? item.catagoryAr
              : item.catagoryEn,
          style: TextStyle(
              color: Provider.of<ThemeProvider>(context, listen: false).isDark
                  ? titleTextColorDark
                  : titleTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      );
}
