import 'package:flutter/material.dart';
import 'package:news_app/sources_tab_directory/tab_item.dart';

import '../modal/SourcesResponse.dart';
import '../news_container.dart';

class TabContainer extends StatefulWidget {
  List<Source> sources = [];

  TabContainer({required this.sources});

  int currentIndex = 0;

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 8),
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
                indicatorColor: Colors.transparent,
                onTap: (index) {
                  widget.currentIndex = index;
                  setState(() {});
                },
                tabs: widget.sources
                    .map((source) => TabItem(
                    isSelected:
                    widget.currentIndex == widget.sources.indexOf(source),
                    source: source))
                    .toList(),
                isScrollable: true),
            Expanded(
                child: NewsContainer(selectedSource: widget.sources[widget.currentIndex],)
            )
          ],
        )
      ),
    );
  }
}
