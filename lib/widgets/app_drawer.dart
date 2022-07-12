import 'package:flutter/material.dart';
import 'package:travel_app/screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text(
              'travel guider',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
              leading: Icon(
                Icons.card_travel,
                size: 30,
                color: Colors.blue,
              ),
              title: Text(
                'travels',
                style: TextStyle(
                    fontFamily: 'ELMessiri',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
          ListTile(
              leading: Icon(
                Icons.filter_list,
                size: 30,
                color: Colors.blue,
              ),
              title: Text(
                'filters',
                style: TextStyle(
                    fontFamily: 'ELMessiri',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(FiltersScreen.screenRoute);
              })
        ],
      ),
    );
  }
}
