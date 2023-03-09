import 'package:flutter/material.dart';
import 'main_app_bar.dart';
import 'side_menu.dart';

class AdvisorManagerScreen extends StatelessWidget {
  AdvisorManagerScreen();

  // These are temporary values until the backend/database connection is made
  final advisors = ['Sean Banerjee', 'Chuck Thorpe'];
  final depts = ['Computer Science', 'Computer Science'];
  final roles = ['Research', 'Academic'];
  final emails = ['sbanerje@clarkson.edu', 'cthorpe@clarkson.edu'];

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: mainAppBar(context, scaffoldKey),
      ),
      endDrawer: sideMenu(context),
      body: Column(children: [
        // Title, Search, and Column Labels ----------------------------------
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          color: const Color(0xFFF3956F),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              // Title -------------------------------------------------------
              const Expanded(
                flex: 2,
                child: Text('Advisor Manager',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                    )),
              ),
            ]),
            // Column Labels -------------------------------------------------
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFF3956F), width: 4),
                color: Colors.white,
              ),
              child: Row(children: <Widget>[
                Expanded(flex: 2, child: buildColumnLabel(context, 'Name')),
                Expanded(
                    flex: 2, child: buildColumnLabel(context, 'Department')),
                Expanded(flex: 2, child: buildColumnLabel(context, 'Role')),
                Expanded(flex: 2, child: buildColumnLabel(context, 'Email'))
              ]),
            ),
          ]),
        ),
        // Course List -------------------------------------------------------
        Flexible(
          flex: 4,
          child: ListView.builder(
              itemCount: advisors.length,
              itemBuilder: (context, index) {
                return AdvisorListItem(
                  advisor: advisors[index],
                  dept: depts[index],
                  role: roles[index],
                  email: emails[index],
                );
              }),
        ),
      ]),
    );
  }

  Widget buildColumnLabel(BuildContext context, String label) {
    return Text(
      label,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: const Color(0xFFF3956F),
        fontWeight: FontWeight.bold,
        fontSize: 22,
        fontFamily: 'Montserrat',
      ),
    );
  }
}

class AdvisorListItem extends StatelessWidget {
  final String advisor;
  final String dept;
  final String role;
  final String email;
  static Color primaryColor = const Color(0xFFF3956F);
  static Color secondaryColor = const Color(0xFFFFFFFF);

  const AdvisorListItem({
    super.key,
    required this.advisor,
    required this.dept,
    required this.role,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75,
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(flex: 2, child: buildTextItem(context, advisor)),
            Expanded(flex: 2, child: buildTextItem(context, dept)),
            Expanded(flex: 2, child: buildTextItem(context, role)),
            Expanded(flex: 2, child: buildTextItem(context, email)),
          ],
        ));
  }

  Widget buildTextItem(BuildContext context, String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: secondaryColor,
        fontSize: 22,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
      ),
    );
  }
}

class AdvisorBuildScreen extends StatelessWidget {
  const AdvisorBuildScreen();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
