import 'package:flutter/material.dart';
import 'main_app_bar.dart';
import 'side_menu.dart';

class DataTablePage extends StatefulWidget {
  final String pageName;
  final Widget pageBody;
  const DataTablePage(
      {super.key, required this.pageName, required this.pageBody});

  @override
  State<DataTablePage> createState() => DataTablePageState();
}

class DataTablePageState extends State<DataTablePage> {
  late Widget pageBody;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  DataTablePageState();

  @override
  initState() {
    super.initState();
    pageBody = widget.pageBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: mainAppBar(context, scaffoldKey),
      ),
      endDrawer: sideMenu(context),
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.85,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(35),
        ),
        padding: const EdgeInsets.all(30),
        child: Column(children: [
          // Title
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              widget.pageName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 50,
              ),
            ),
          ]),
          pageBody,
        ]),
      )),
    );
  }
}
