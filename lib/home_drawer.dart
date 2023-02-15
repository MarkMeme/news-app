import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import 'my_theme_data.dart';

class HomeDrawer extends StatefulWidget {
  Function onCategoryItemCallBack ;
  HomeDrawer ({required this.onCategoryItemCallBack});
  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        color: MyThemeData.primaryColor,
        width: double.infinity,
        //height: 46,
        padding: EdgeInsets.symmetric(vertical: 45),
        child: Text(AppLocalizations.of(context)!.news,
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center),
      ),
      Container(
        margin: EdgeInsets.all(12),
        child: InkWell(
            onTap: () {
                widget.onCategoryItemCallBack();

              },
            child: Row(
              children: [
                const Icon(Icons.list_alt),
                const SizedBox(
                  width: 8,
                ),
                Text(AppLocalizations.of(context)!.categories,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25)),
              ],
            )),
      ),
      Divider(
        thickness: 2,
        height: 2,
        color: Colors.grey,
      ),
      Container(
        margin: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.settings),
                const SizedBox(
                  width: 8,
                ),
                Text(AppLocalizations.of(context)!.language,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25)),
              ],
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                provider.changeLanguage('en');
                Navigator.pop(context);

              },
              child: provider.appLanguage == 'en'
                  ? getSelectedWidget(AppLocalizations.of(context)!
                      .english) //AppLocalizations.of(context)!.english
                  : getUnselectedWidget(AppLocalizations.of(context)!.english),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                provider.changeLanguage('ar');
                Navigator.pop(context);

              },
              child: provider.appLanguage == 'ar'
                  ? getSelectedWidget(AppLocalizations.of(context)!
                      .arabic) //AppLocalizations.of(context)!.arabic
                  : getUnselectedWidget(AppLocalizations.of(context)!.arabic),
            )
          ],
        ),
      )
    ]));
  }

  Widget getSelectedWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 21,
              fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.check_box,
          size: 25,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }

  Widget getUnselectedWidget(String text) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        text,
        style: TextStyle(
            color: Theme.of(context).textTheme.headline3!.color,
            fontSize: 21,
            fontWeight: FontWeight.bold),
      )
    ]);
  }
}
