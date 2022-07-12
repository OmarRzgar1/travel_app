import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/trip_detail_screen.dart';

class TripItem extends StatelessWidget {
  late final String title;
  late final String imageUrl;
  late final int duration;
  late final String id;
  late final TripType tripType;
  late final Season season;
  late final Function removeItem;

  TripItem(
      {required this.title,
      required this.imageUrl,
      required this.removeItem,
      required this.id,
      required this.duration,
      required this.tripType,
      required this.season}); //constructor to recieve data from app-data file

  String get seasonText {
    //this is for changing the semester word to arabic
    switch (season) {
      case Season.Autumn:
        return 'پایز';
        break;
      case Season.Spring:
        return 'بەهار';
        break;
      case Season.Summer:
        return 'هاوین';
        break;
      case Season.Winter:
        return 'زستان';
        break;
      default:
        return 'نەزانراوە';
    }
  }

  String get tripTypeText {
    //this is for changing the triptype enum to the kurdish text via switch
    switch (tripType) {
      case TripType.Activities:
        return 'جالاکی';
        break;
      case TripType.Exploration:
        return 'دۆزینەوە';
        break;
      case TripType.Recovery:
        return 'جەوگۆڕین';
        break;
      case TripType.Therapy:
        return 'پزیشکی';
        break;
      default:
        return 'نەزانراوە';
    }
  }

  void selectTrip(BuildContext context) {
    //lera navigator bakardenin bo away ka hatwcho bkain lamnewan shashakan lanaw aw class astatic const  screenroute drwst dakain w naweki le daneyn pashan la routes la main.dart  daynwsin w pashamnish lanaw push named nawy classaka w pashan .screeroute danwsin ka aw shashayaya ka lakaty click boy daCHIN

    Navigator.of(context)
        .pushNamed(TripDetailScreen.screenRoute, arguments: id)
        .then((result) {
          if (result!=null){
            removeItem(result);
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              15), //this is for how many deegre of the circular angls
        ),
        elevation: 7, //this is  for shadow
        margin: EdgeInsets.all(10), //this is for outside space
        child: Column(
          children: [
            Stack(
              //this is for making a tabaqat zor
              children: [
                ClipRRect(
                  //This is for changing the shape of the inside image
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    //this is for making the angle circular
                    topRight: Radius.circular(
                        15), //this is for making the angle circular
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    //this is for making gradint o the  images
                    gradient: LinearGradient(
                      //start and end places
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        //this is for choosing colors
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: [
                        //this is for making the photo takes opacity in %60 of the container in start and in the end of the container takes 0.8 opacity it means near %100
                        0.6,
                        1,
                      ],
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Theme.of(context)
                            .accentColor, //for taking the color in main.dart that it is orange
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration ڕۆژ'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_sunny_sharp,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(seasonText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(tripTypeText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ); //Inkwell widget is using for making a trip item cards buutonable
  }
}
