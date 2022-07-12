import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../app-data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10, //for horzantal spacing
        crossAxisSpacing: 10, // for vertical spacing
      ),
      children: Categories_data.map((categoryData) => CategoryItem(
            title: categoryData.title,
            imageUrl: categoryData.imageUrl,
            id: categoryData.id,
          )).toList(),
    );
  }
}
