import 'package:flutter/material.dart';
import 'package:majorizer_ui/widgets/course_class.dart';

class CatalogMap {
  CatalogMap();

  late Map<String, Map<int, Course>>
      catalogMap; //Have department abbrev. ("CS") as key, with
  //the map of the Course(s) in the CS department as the value
}

class DepartmentMap {
  DepartmentMap();

  late Map<int, Course>
      departmentMap; //Have full module # (344) as key, with CS 344 Algorithms... Course as the value
}
