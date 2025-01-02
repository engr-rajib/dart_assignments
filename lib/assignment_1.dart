abstract class Role {
  void displayRole ();
}

class Person {
  String name;
  int age;
  String address;
  Role role;

  Person (this.name, this.age, this.address, this.role);

  String get getName => name;
  int get getAge => age;
  String get getAddress => address;

  void displayRole () {
    role.displayRole();
  }
}

class Student extends Person {
  int studentID;
  String grade;
  List<double> courseScores;

  Student (String name, int age, String address,
      this.studentID, this.grade, this.courseScores):
        super (name, age, address, StudentRole());

}

class StudentRole extends Role {
  @override
  void displayRole () {
    print('Role: Student');
  }
}


class Teacher extends Person {
  int teacherID;
  List<String> coursesTaught;

  Teacher (String name, int age, String address,
      this.teacherID, this.coursesTaught):
      super (name, age, address, TeacherRole());
}

class TeacherRole extends Role {
  @override
  void displayRole () {
    print ('Role: Teacher');
  }
}

void main () {
  Student std1 = Student ('John Doe', 20, '123 Main Street', 24, 'A', [90, 85, 82]);
  print ('Student Information.');
  std1.displayRole();
  print('Name: ${std1.getName}');
  print('Age: ${std1.age}');
  print('Address: ${std1.getAddress}');
  print ('Student ID: ${std1.studentID}');
  double avgScore;
  double total = 0.0;
  for (int i =0; i < (std1.courseScores.length); i++) {
    total = total + std1.courseScores[i];
  }
  avgScore = total / std1.courseScores.length;

  print ('Average Score: $avgScore');

  print('');
  print ('Teacher Information.');

  Teacher teacher1 = Teacher (
    'Mrs. Smith', 35, '456 Oak St.',
    103, ['Math', 'English', 'Bangla']
  );

  teacher1.displayRole();
  print('Name: ${teacher1.getName}');
  print ('Age: ${teacher1.getAge}');
  print ('Address: ${teacher1.getAddress}');
  print ('Teacher ID: ${teacher1.teacherID}');
  print ('Courses Taught:');
  for (var course in teacher1.coursesTaught) {
    print('-$course');
  }
}