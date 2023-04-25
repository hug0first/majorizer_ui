import 'package:flutter/material.dart';
import '/widgets/department.dart';
import '/models/course_catalog.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({super.key});

  @override
  State<DepartmentScreen> createState() => DepartmentScreenState();
}

class DepartmentScreenState extends State<DepartmentScreen> {
  bool isExpanded = false;
  List<CourseCatalog> catalog = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
