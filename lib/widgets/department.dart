import 'dart:collection';
import '../models/course_catalog.dart';

class Department extends Comparable<Department> {
  String id;
  String name;
  List<CourseCatalog> courses = [];

  Department({required this.id, required this.name});

  @override
  int compareTo(Department other) {
    return id.compareTo(other.id);
  }

  @override
  bool operator ==(Object other) {
    return (other is Department) && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

Future<List<Department>> parseCatalog(
    Future<List<CourseCatalog>> courseCatalog) async {
  SplayTreeSet<Department> departments = SplayTreeSet();
  String departmentName;
  Department tempDepartment;
  List catalog = await courseCatalog;
  for (CourseCatalog course in catalog) {
    departmentName = departmentMap[course.designation] ?? "";
    tempDepartment = Department(id: course.designation, name: departmentName);
    departments.add(tempDepartment);
    departments.lookup(tempDepartment)?.courses.add(course);
  }

  return departments.toList();
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
  'DA': 'Digital Arts',
  'DS': 'Data Science',
  'EAP': 'English for Academic Purposes',
  'EC': 'Economics',
  'ED': 'Education',
  'EE': 'Electrical Engineering',
  'EHS': 'Environmental Health Science',
  'EM': 'Engineering & Mgmt',
  'ES': 'Engineering Science',
  'EV': 'Environmental Scienve & Policy',
  'FILM': 'Film Studies',
  'FN': 'Finance',
  'FY': 'First Year',
  'HC': 'Health Care Management',
  'HIST': 'History',
  'HP': 'Honors Program',
  'HS': 'Health Sciences',
  'HSS': 'Humanities & Social Sciences',
  'HUM': 'Humanities',
  'IGN': 'Ignite',
  'IS': 'Information Systems',
  'IT': 'Information Technology',
  'LANG': 'Language',
  'LIB': 'Library Services',
  'LIT': 'Literature',
  'LW': 'Law',
  'MA': 'Mathematics',
  'ME': 'Mechanical Engineering',
  'MK': 'Marketing',
  'MP': 'Multidisiplinary',
  'MS': 'Military Science',
  'MSE': 'Materials Sci & Engineering',
  'MT': 'Multidisciplinary Project Team',
  'OM': 'Operations Management',
  'OS': 'Organizational Studies',
  'PE': 'Physical Education',
  'PH': 'Physics',
  'PHIL': 'Philosophy',
  'POL': 'Political Science',
  'PT': 'Physical Therapy',
  'PY': 'Psychology',
  'SA&S': 'School of Arts and Sciences',
  'SB': 'School of Business',
  'SC': 'School of Science',
  'SD': 'Social Documentation',
  'SI': 'Semester in Industry',
  'SOC': 'Sociology',
  'SS': 'Social Sciences',
  'STAT': 'Statistics and Probability',
  'STEM': 'Science, Tech, Eng, and Math',
  'STS': 'Science, Technology, and Society',
  'TECH': 'Technology',
  'UNIV': 'University',
};
