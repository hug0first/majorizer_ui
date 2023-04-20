import 'package:flutter/material.dart';
import 'package:majorizer_ui/widgets/catalog_map.dart';
import 'package:majorizer_ui/widgets/dropdown_button_lists.dart';
import '../main.dart';
import 'main_app_bar.dart';
import 'side_menu.dart';

class TransferScreen extends StatefulWidget {
  TransferScreen();

  @override
  State<StatefulWidget> createState() => TransferScreenState();
}

class TransferScreenState extends State<TransferScreen> {
  TransferScreenState();

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF3956F),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: mainAppBar(context, scaffoldKey),
      ),
      endDrawer: sideMenu(context),
      body: Column(
        //needs to ask for what the class transfers for so it works with the algorithm
        children: <Widget>[],
      ),
    );
  }

  Widget dropdownMenuRow1() {
    String departmentItem = "Department";
    String moduleItem = "Module";
    List<DropdownMenuItem<String>> moduleDropdownItems;

    if (departmentItem != "Department") {
      moduleDropdownItems = DepartmentMap(departmentItem)
          .departmentMap
          .keys
          .toList() as List<DropdownMenuItem<String>>;
    } else {
      moduleDropdownItems = [];
    }

    return Row(
      children: <Widget>[
        DropdownButton(
          items: CatalogMap().catalogMap.keys.toList()
              as List<DropdownMenuItem<String>>,
          value: departmentItem,
          onChanged: (String? newValue) {
            setState(() {
              departmentItem = newValue!;
            });
          },
        ),
        DropdownButton(
          items: moduleDropdownItems,
          value: moduleItem,
          onChanged: (String? newValue) {
            if (departmentItem == "Department") {
              null;
            } else {
              setState(() {
                moduleItem = newValue!;
              });
            }
          },
        ),
      ],
    );
  }
}
