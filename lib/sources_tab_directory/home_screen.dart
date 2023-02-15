import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/modal/category.dart';

import '../category_details.dart';
import '../home_drawer.dart';
import '../search/news_search.dart';
import 'categories_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Image.asset('assets/pattern.png', fit: BoxFit.cover),
      ),
      Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.news,
              style: Theme.of(context).textTheme.headline1,
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35))),
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate: NewsSearch()
                    );
                  },
                  icon: const Icon(Icons.search_rounded, size: 30)),
              const SizedBox(
                width: 15,
              )
            ],
          ),
          drawer: Drawer(
            child: HomeDrawer(onCategoryItemCallBack: onCategoryItemCallBack),
          ),
          body: selectedCategory == null
              ? CategoriesScreen(
                  onCategoryCallBack: onCategortyCallBack,
                )
              : CategoryDetails(
                  category: selectedCategory!,
                ))
    ]);
  }

  Category? selectedCategory = null;

  void onCategortyCallBack(Category category) {
    selectedCategory = category;
    setState(() {});
  }

  void onCategoryItemCallBack() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
