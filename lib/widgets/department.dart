import '../api/api.dart';
import '../models/course_catalog.dart';

class Department {
  Department({this.id, this.name});

  String? id;
  String? name;
}

Future<Set<Department>> parseCatalog() async {
  List<CourseCatalog> catalog = await getCourseCatalog();
  final regex = RegExp(r'([A-Z]+)([0-9]+)');

  Set<String> departmentIds = <String>{};
  for (var course in catalog) {
    final match = regex.firstMatch(course.courseid);
    if (match != null) departmentIds.add(match.group(1)!);
  }
  print(departmentIds);
  print(departmentIds.length);

  Set<Department> departments = <Department>{};
  for (var id in departmentIds) {
    Department temp = Department();
    temp.id = id;
    temp.name = departmentMap[id];
    departments.add(temp);
  }
  departments.forEach((element) {
    print(element.id);
    print(element.name);
  });

  return departments;
}

const Map<String, String> departmentMap = {
  'AC': 'Accounting',
  'AE': 'Aeronautical Engineering',
  'AMST': 'American Studies',
  'ANTH': 'Anthropology',
  'ARTS': 'Visual and Performing Arts',
  'AS': 'Air, Space, & Cyberspace',
  'BIE': 'Bioethics',
  'BR': 'Biomedical/Rehabilitation Engineering',
  'BY': 'Biology',
  'CE': 'Civil and Environmental Engineering',
  'CH': 'Chemical Engineering',
  'CM': 'Chemistry',
  'COMM': 'Communication',
  'CS': 'Computer Science',
  'PY': 'Psychology',
  'MA': 'Mathematics',
};
