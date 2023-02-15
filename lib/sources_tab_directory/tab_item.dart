import 'package:flutter/material.dart';

import '../modal/SourcesResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected ;
  Source source ;
  TabItem({required this.isSelected  , required this.source});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: isSelected == true
            ? Colors.green
            : Colors.transparent,
        border: Border.all( width: 3,color: Colors.green)
      ),
      padding: EdgeInsets.all(13),
      child: Text(source.name?? '',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: isSelected == true
            ? Colors.white
            : Colors.green
      ),
      ),
    );
  }
}
