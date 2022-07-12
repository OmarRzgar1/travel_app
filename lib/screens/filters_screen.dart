import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filters';
  final Function saveFilters;
  final Map<String,bool>currentFilters;


  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;


@override
 void  initState(){
  // _summer=widget.currentFilters['summer'];
  // _winter=widget.currentFilters['winter'];
  // _family=widget.currentFilters['family'];
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('filter'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'summer': _summer,
                'winter': _winter,
                'family': _family,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      //we added this ti here to when we from drawer went to the filter screen then we c can come back to the travel screen
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text('summer travels'),
                  subtitle: Text('shows the summer travels only'),
                  value: _summer,
                  onChanged: (newValue) {
                    setState(() {
                      //this is for cgnaging the switchin the first it is offbut when you click n it it will change to the on  because it recevie the new valye in set state then this new value equals to the is in summmmer which is used to the value in above
                      _summer = newValue;
                    });
                  },
                  //this is for making radio buttins
                ),
                SwitchListTile(
                  title: Text('winter  travels'),
                  subtitle: Text('shows the winter travels only'),
                  value: _winter,
                  onChanged: (newValue) {
                    setState(() {
                      //this is for cgnaging the switchin the first it is offbut when you click n it it will change to the on  because it recevie the new valye in set state then this new value equals to the is in summmmer which is used to the value in above
                      _winter = newValue;
                    });
                  },
                  //this is for making radio buttins
                ),
                SwitchListTile(
                  title: Text('family travels'),
                  subtitle: Text('shows the family travels only'),
                  value: _family,
                  onChanged: (newValue) {
                    setState(() {
                      //this is for cgnaging the switchin the first it is offbut when you click n it it will change to the on  because it recevie the new valye in set state then this new value equals to the is in summmmer which is used to the value in above
                      _family = newValue;
                    });
                  },
                  //this is for making radio buttins
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
