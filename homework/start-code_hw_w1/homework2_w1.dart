double computeAverage (List<int> scores){
  var average = 0;
  for(int score in scores){
    average += score;
  }
  return average / scores.length;
}
void main() {
  final students = [
    {
      "name": "Dara",
      "Dart": 70,
      "Flutter": 80,
      "Database": 60,
    },
    {
      "name": "Sokha",
      "Dart": 50,
      "Flutter": 90,
      "Database": 70,
    },
  ];
  final courses = ["Dart", "Flutter", "Database"];

  // TODO: Implement computeAverage()
  // TODO: For each course:
  // 1. Create a list of scores
  // 2. Compute the average
  // 3. Display the course name and average
  // for (var student in students) {
  //   print(student);
  // }

  for (var course in courses){
    List<int> scores = [];
    for(var student in students){
      scores.add(student[course] as int);
    }
    computeAverage(scores);
    print("${course} :  ${scores}");
  }
  // ====== method 2 ===== //
  // for (var course in courses){
  //   var scores = students.map((student) => student[course] as int).toList();
  //   computeAverage(scores);
  //   print("${course} : ${scores}");
  // }
}
