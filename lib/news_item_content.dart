import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/news_container.dart';
import 'package:url_launcher/url_launcher.dart';
import 'my_theme_data.dart';

class NewsItemContent extends StatefulWidget {
  static const String routeName = 'newsItemContent';

  @override
  State<NewsItemContent> createState() => _NewsItemContentState();
}

class _NewsItemContentState extends State<NewsItemContent> {

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as ItemArgs;
    return Stack(
        children: [
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
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline1,
                  ),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35)))),
              body: Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        clipBehavior: Clip.antiAlias,
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                        child: Image.network(args.news.urlToImage ?? '')),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      args.news.author ?? '',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: MyThemeData.greyColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      args.news.title ?? '',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: MyThemeData.blackColor),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      args.news.publishedAt ?? '',
                      style: TextStyle(
                          fontSize: 16, color: MyThemeData.blackColor),
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      args.news.content ?? '',
                      style: TextStyle(
                          fontSize: 17, color: MyThemeData.blackColor),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                       launchingUrl(args.news.url);
                      }
                      ,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Read more ',
                            style: TextStyle(
                                fontSize: 16, color: MyThemeData.blackColor),
                          ),
                          const Icon(Icons.arrow_forward,size: 19,)
                        ],
                      ),
                    ),
                  ],
                ),
              )
          )
        ]);
  }

  launchingUrl(String? url) async {
    if (url == null){
      return ;
    }
    var uri = Uri.parse(url) ;
    if (await canLaunchUrl(uri) ){
      print(canLaunchUrl(uri));
      await launchUrl(uri);
    }
  }


  }
