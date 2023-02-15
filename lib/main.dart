import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'my_theme_data.dart';
import 'news_item_content.dart';
import 'sources_tab_directory/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppConfigProvider(),
      child:const MyApp()
  )  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
      HomeScreen.routeName : (context) => HomeScreen(),
        NewsItemContent.routeName: (context) => NewsItemContent()
    },
      home: HomeScreen(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      theme: MyThemeData.lightMode,
    );
  }
}
