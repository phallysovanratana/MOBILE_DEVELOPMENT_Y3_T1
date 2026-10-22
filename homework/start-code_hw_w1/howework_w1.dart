List<String> get_pass_students (Map<String , int> students){
  List<String> pass_student = [];
// ===== method 1 ===== // (use eentries to get both key and value as one container)
  // for (var student in students.entries){
  //   if(student.value >= 50){
  //     pass_student.add(student.key);
  //   }
  // }

// ====== method 2 ====== // (list by key use! to tell the map that the variable will have value)
  // for (var name in students.keys){
  //   if(students[name]! >= 50){
  //     pass_student.add(name);
  //   }
  // }

  students.forEach((name , score) {
    if(score >= 50){
      pass_student.add(name);
    }
  });

  return pass_student;
}


void main () {
  
  Map<String , int > students_score = {
    "Dara": 78,
    "Sokha": 45,
    "Lina": 62,
    "Vanna": 39,
    "Mony": 85
  };

  var pass_student = get_pass_students(students_score);
  for (var s in pass_student){
    print(s);
  }

}

