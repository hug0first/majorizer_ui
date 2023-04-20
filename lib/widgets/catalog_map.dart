import 'package:majorizer_ui/models/course_catalog.dart';
import 'package:majorizer_ui/widgets/course_class.dart';
import '../api/api.dart';

class CatalogMap {
  CatalogMap() {
    //loop thorugh all courses, and if the dept has no key in the map, add to catalogMap. Then
    //use the addToMap for the DepartmentMapspecific to the key using the dept as the String for the constructor
    initMap();
  }
  Future<void> initMap() async {
    List<CourseCatalog> catalog = await getCourseCatalog();
    for (CourseCatalog course in catalog) {
      String courseDept = course.courseid.replaceAll(RegExp('[0-9]'), '');
      if (catalogMap.containsKey(courseDept)) {
        catalogMap[courseDept] = DepartmentMap(courseDept);
      }
      (catalogMap[courseDept])?.addToMap(course);
    }
  }

  late Map<String, DepartmentMap>
      catalogMap; //Have department abbrev. ("CS") as key, with
  //the map of the Course(s) in the CS department as the value
}

class DepartmentMap {
  DepartmentMap(String dept);

  void addToMap(CourseCatalog course) {
    String courseIdString = course.courseid.replaceAll(RegExp(r'[^0-9]'), '');
    int courseIdNum = int.parse(courseIdString);

    departmentMap[courseIdNum] = Course(
        'department',
        (courseIdNum as String)[0],
        (courseIdNum as String)[1] + (courseIdNum as String)[2],
        'term',
        dept,
        '$courseIdNum',
        course.coursename);
  }

  /* Future<void> addToMap(int module) async {
    List<CourseCatalog> catalog = await getCourseCatalog();
    for (CourseCatalog course in catalog) {
      String courseIdString = course.courseid.replaceAll(RegExp(r'[^0-9]'), '');
      int courseId = int.parse(courseIdString);
      if (courseId == module) {
        String courseDept = course.courseid.replaceAll(RegExp('[0-9]'), '');
        departmentMap[module] = Course(
            'department',
            (courseId as String)[0],
            (courseId as String)[1] + (courseId as String)[2],
            'term',
            courseDept,
            '$courseId',
            course.coursename);
      }
    }
  } */

  late String dept;
  late final Map<int, Course>
      departmentMap; //Have full module # (344) as key, with CS 344 Algorithms... Course as the value
}
