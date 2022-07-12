import 'package:flutter/material.dart';
import '../screens/categories_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const CategoryItem(
      {required this.title,
      required this.imageUrl,
      required this.id}); //for getting values

  void selectCategory(BuildContext ctx) {
    //for going to the available trips screen
    Navigator.of(ctx).pushNamed(
      CategoriesTripsScreen.screenRoute,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // for make the container as a button when we click on it it will go to the another page
      onTap: () => selectCategory(context),
      //calling method using anonymous function

      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(35),
      //for make angles circular
      child: Stack(
        //for making floors above other (tabq)
        children: [
          ClipRRect(
            //for make the picture circular
            borderRadius: BorderRadius.circular(35),
            //this is the value of the circling
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover, //for get all place
            ),
          ),
          Container(
            decoration: BoxDecoration(
              //for styling box
              borderRadius: BorderRadius.circular(35),
              color: Colors.black.withOpacity(
                  0.4), //for coloring picture and make it a few black to the text be readable
            ),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center, //to move the text to the center
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline6, //using headline 6 that was declared in the main.dart
            ),
          ),
        ],
      ),
    );
  }
}
