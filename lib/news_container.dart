import 'package:flutter/material.dart';
import 'package:news_app/news/news_item.dart';

import 'api_manage.dart';
import 'modal/NewsResponse.dart';
import 'modal/SourcesResponse.dart';
import 'news_item_content.dart';

class NewsContainer extends StatefulWidget {
  Source selectedSource;

  NewsContainer({required this.selectedSource});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(sourceId: widget.selectedSource.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                const Text('Error'),
                ElevatedButton(onPressed: () {}, child: const Text('Refresh'))
              ],
            );
          }
          if (snapshot.data?.status != 'ok') {
            return Column(children: [
              Text(snapshot.data?.message ?? ''),
              ElevatedButton(onPressed: () {}, child: const Text('Refresh'))
            ]);
          } else {
            var newsList = snapshot.data?.articles ?? [];
            return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, NewsItemContent.routeName,arguments: ItemArgs(news: newsList[index]) );
                  },
                  child:  NewsItem( news: newsList[index])
                );

              },
            );
          }
        });
  }
}
class ItemArgs{
  News news;
  ItemArgs({required this.news});
}