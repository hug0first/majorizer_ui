import 'package:flutter/material.dart';
import 'package:majorizer_ui/widgets/main_app_bar.dart';
import 'package:majorizer_ui/widgets/size_config.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: Color(0xFFF3956F),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: mainAppBar(context, scaffoldKey),
      ),
      body: Column(
        children: [
          TitleBar(),
          Divider(
            color: Colors.white,
            thickness: 4,
            indent: 20,
            endIndent: 20,
          ),
          Container(
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height * 0.67,
            child: Container(
              child: ProgramList(
                items: [
                  ProgramListItem('CS', 'Computer\nScience'),
                  ProgramListItem('CM', 'Chemistry'),
                  ProgramListItem('PY', 'Psychology'),
                  ProgramListItem('MA', 'Mathematics'),
                  ProgramListItem('CS', 'Computer\nScience'),
                  ProgramListItem('CM', 'Chemistry'),
                  ProgramListItem('PY', 'Psychology'),
                  ProgramListItem('MA', 'Mathematics'),
                  ProgramListItem('CS', 'Computer\nScience'),
                  ProgramListItem('CM', 'Chemistry'),
                  ProgramListItem('PY', 'Psychology'),
                  ProgramListItem('MA', 'Mathematics'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Course Catalog',
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Flexible(child: search(context)),
        ],
      ),
    );
  }

  Widget search(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400, maxHeight: 100),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Courses',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 3, color: Color(0xFFda6237)),
          ),
          suffixIcon: Icon(
            Icons.search,
            color: Color(0xFFda6237),
          ),
          focusColor: Color(0xFFda6237),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

class ProgramList extends StatelessWidget {
  final List<ProgramListItem> items;
  const ProgramList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: items,
    );
  }
}

class ProgramListItem extends StatelessWidget {
  String programID;
  String programName;

  ProgramListItem(this.programID, this.programName);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(180),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      child: Column(
        children: [
          buildID(context),
          buildName(context),
        ],
      ),
    );
  }

  Widget buildID(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
      padding: const EdgeInsets.all(5),
      child: Text(
        programID,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: MediaQuery.of(context).size.height * 0.1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildName(BuildContext context) {
    return Text(
      programName,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: MediaQuery.of(context).size.height * 0.04,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
