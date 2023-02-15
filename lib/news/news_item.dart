import 'package:flutter/material.dart';
import '../modal/NewsResponse.dart';
import '../my_theme_data.dart';

class NewsItem extends StatelessWidget {
  News news ;
  NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch ,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25)
            ),
            child: Image.network(news.urlToImage ?? '')
            
          ),
          const SizedBox(height: 8,),
          Text(news.author ?? '',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: MyThemeData.greyColor
          ),
          ),
          const SizedBox(height: 8,),
          Text(news.title ?? '',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: MyThemeData.blackColor
            ),
          ),
          const SizedBox(height: 8,),
          Text(news.publishedAt ?? '',
            style: TextStyle(
                fontSize: 16,
                color: MyThemeData.blackColor
            ),
            textAlign: TextAlign.end,
          ),
          const SizedBox(height: 8,),
          Divider(thickness: 1.5,color: MyThemeData.greyColor,)
        ],
      ),
    );
  }
}

