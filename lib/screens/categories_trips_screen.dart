import 'package:flutter/material.dart';
import '../widgets/trip_item.dart';

import '../models/trip.dart';

class CategoriesTripsScreen extends StatefulWidget {
  static const screenRoute = '/category-trips';
  late final List<Trip>avaibleTrips;
  CategoriesTripsScreen(this.avaibleTrips);

  @override
  State<CategoriesTripsScreen> createState() => _CategoriesTripsScreenState();
}

class _CategoriesTripsScreenState extends State<CategoriesTripsScreen> {
  late var categoryTitle;
  late List<Trip> displayTrips;

  @override
  void initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgument =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgument['id'];
     categoryTitle =routeArgument['title'];
    displayTrips = widget.avaibleTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            tripType: displayTrips[index].tripType,
            season: displayTrips[index].season,
            id: displayTrips[index].id,
            removeItem: _removeTrip,
          );
        },
        itemCount: displayTrips.length,
      ),
    );
  }
}
