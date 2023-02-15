import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/providers/app_config_provider.dart';
import 'package:news_app/sources_tab_directory/category_item.dart';
import 'package:provider/provider.dart';

import '../modal/category.dart';

class CategoriesScreen extends StatefulWidget {
  Function onCategoryCallBack;

  CategoriesScreen({required this.onCategoryCallBack});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List categoriesList = Category.getCategories();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.pickYourCategoryofinterest,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(
            height: 13,
          ),
          Expanded(
              child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 11, crossAxisSpacing: 8),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    widget.onCategoryCallBack(categoriesList[index]);
                  },
                  child: CategoryItem(
                      category: categoriesList[index], index: index));
            },
            itemCount: categoriesList.length,
          ))
        ],
      ),
    );
  }
}
