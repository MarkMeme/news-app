import 'package:flutter/material.dart';

import '../api_manage.dart';
import '../modal/NewsResponse.dart';
import '../news/news_item.dart';
import '../news_container.dart';
import '../news_item_content.dart';

class NewsSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (){
            showResults(context);
          },
          icon: Icon(Icons.search_rounded,size: 25,))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
    IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.clear,size: 25,));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<NewsResponse>(
          future: ApiManager.getNews(searchKeyWord: query),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
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
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('What do you want to search about ?',
          style: TextStyle(fontSize: 20),
        ),
      ),
    ) ;
  }

}