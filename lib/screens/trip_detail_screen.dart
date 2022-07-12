import 'package:flutter/material.dart';
import '../app-data.dart';

class TripDetailScreen extends StatelessWidget {
  static const screenRoute = '/trip-detail';

  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget buildListViewContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(horizontal: 17),
        height: 200,
        padding: EdgeInsets.all(10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) =>
        trip.id ==
        tripId); //lera aw tripId ka lasarawa tahryf kraya brytya lo awaya mahlwmat lA app_data bini ja ka aw trip Id yaksan bw baw trip id lanaw app datay haya laxwareawa mahlwmatakani awi waragri  atwanin hngi har shtakman pewist bkatley warbrrin
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedTrip.title}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildSectionTitle(context, 'چالاکیەکان'),
            buildListViewContainer(ListView.builder(
              itemCount: selectedTrip.activities.length,
              itemBuilder: (ctx, index) => Card(
                elevation: 0.3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(selectedTrip.activities[index]),
                ),
              ),
            )),
            SizedBox(
              height: 10,
            ),
            buildSectionTitle(context, 'پلانی ئەمڕۆ'),
            buildListViewContainer(ListView.builder(
              itemCount: selectedTrip.program.length,
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('ڕۆژی${index + 1}'),
                    ),
                    title: Text(selectedTrip.program[index]),
                  ),
                  Divider(),
                ],
              ),
            ),),
            SizedBox(height: 100,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete_outline),
        onPressed: (){
          Navigator.of(context).pop(tripId);
        },
      ),
    );
  }
}
