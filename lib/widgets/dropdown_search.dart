import 'package:flutter/material.dart';
import 'package:majorizer_ui/widgets/home_screen.dart';
import 'major_minor_list.dart';
import '../main.dart';

//Right now, this is just implemented directly in the home_screen.dart file. It displays the major/minor quick add functionality
//I have no idea why, but even when using possibleMajorListTiles() from HomeScreenState(),
//there is still a problem with the widget state tree. I've looked and can't find a difference between
//the implementation in HomeScreenState() and in this file (they should be identical, except in
//HomeScreenState() there is no class call like there is here).

class MajorSearch extends State<HomeScreen> {
  MajorSearch();

  var majorTitleTextController = TextEditingController();

  Widget search(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Add Major',
            hintText: 'Major Title',
          ),
          controller: majorTitleTextController,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.3,
          height: MediaQuery.of(context).size.height / 15,
          child: ListView(
            children: [], //HomeScreenState().possibleMajorListTiles(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
