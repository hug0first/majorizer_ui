class Course {
  Course(this.department, this.level, this.module, this.term, this.deptAbbrev,
      this.fullModule, this.name);

  mapInit() {
    Map<int, List<Course>> semesterSchedulesMap = {
      1: allCourses,
      2: schedule,
    };
    return semesterSchedulesMap;
  }

  List<Course> allCourses = [
    Course("Computer Science", "300", "41", "Fall 2023", "CS", "341",
        "Intro to CS"),
    Course(
        "Chemistry", "100", "31", "Fall 2023", "CH", "131", "Intro Chemistry"),
    Course("Mathematics", "100", "31", "Fall 2023", "MA", "131", "Calculuis I"),
    Course("Computer Science", "200", "42", "Spring 2024", "CS", "242",
        "Intro to CS 2"),
    Course("Univ", "100", "00", "Fall 2023", "UNIV", "100",
        "The Clarkson Seminar"),
  ];

  List<Course> schedule = [
    Course("department", "level", "module", "term", "deptAbbrev", "fullModule",
        "name")
  ];

  String? department;
  String? level;
  String? module;
  String? term;
  String? deptAbbrev;
  String? fullModule;
  String? name;
  Map<int, List> semesterSchedulesMap = [] as Map<int, List<Course>>;
}
