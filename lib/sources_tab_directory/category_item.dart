import 'package:flutter/material.dart';

import '../modal/category.dart';

class CategoryItem extends StatelessWidget {
  int index;
  Category category ;

  CategoryItem({
    required this.category,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(category.color),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular((index % 2 != 0 ) ? 0: 22),
          bottomRight: Radius.circular((index % 2 == 0 ) ? 0: 22),
          topLeft: const Radius.circular(22),
          topRight: const Radius.circular(22)
        )
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(category.imagePath,height: 112,fit: BoxFit.fill),
          Text(category.title,style: Theme.of(context).textTheme.subtitle2,)
        ],
      )
    );
  }
}
