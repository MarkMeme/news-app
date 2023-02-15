import 'package:flutter/material.dart';
import 'package:news_app/sources_tab_directory/tab_container.dart';

import 'api_manage.dart';
import 'modal/SourcesResponse.dart';
import 'modal/category.dart';

class CategoryDetails extends StatelessWidget {
  Category category;
  CategoryDetails ({required this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManager.getSources(category.id),
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
          var sourcesList = snapshot.data?.sources ?? [];
          return TabContainer(
            sources: sourcesList,
          );
        }
      },
    );
  }
}
