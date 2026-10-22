import 'package:lms_layered_architecture_example/model/course_result.dart';

import '../model/student.dart';
import '../model/course.dart';



class LmsSystem {
  final List<Student> students = [];
  final List<Course> courses = [];
  final List<CourseResult> scores = [];
  
  
  void createCourse ({required String id , required String name}){
    Course? course = findCourseOrNull(id);
    if(course != null){
      throw Exception("Course is already Existed");
    }
    courses.add(Course(id: id, name: name));
  }

  void removeCourse ({required String courseId}){
    Course? course = findCourseOrNull(courseId);
    if(course == null){
      throw Exception('course doesnt existed');
    }
    if(course.studentIds.isNotEmpty){
      throw Exception('course cannot remove : students already enrolled');
    }
    for (var result in scores) {
      if (result.courseId == courseId) {
        throw Exception('course cannot remove : results existed');
      }
    }
    courses.remove(course);   
  }

  void enrollStudent({required String studentId, required String courseId }){
    Course? course = findCourseOrNull(courseId);
    if (course == null){
      throw Exception('Course ${courseId} not found');
    }

    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }

    for(var s in course.studentIds ){
      if (s == studentId){
        throw Exception('student already enrolled to course');
      }
    }    
    for(var c in courses){
      if(c.id == courseId){
        c.studentIds.add(studentId);
      }
    }
  }

  void addScore({required String courseId , required String studentId, required int score}){
    Course? course = findCourseOrNull(courseId);
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }
    if (course == null){
      throw Exception('Course ${courseId} not found');
    }   
    if (!course.studentIds.contains(studentId)){
      throw Exception('student isnt enrolled to course yet');
    }
    for(var score in scores){
      if(score.studentId == studentId && score.courseId == courseId){
        throw Exception('score can not be doublicate!!');
      }
    }
    if(score > 100 || score < 0){
      throw Exception('score must be between 0 - 100');
    }
    scores.add(CourseResult(courseId, studentId, score)); 
  }

  void removescore({required String studentId , required String courseId}) {
    Course? course = findCourseOrNull(courseId);
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }
    if (course == null){
      throw Exception('Course ${courseId} not found');
    }  
    bool isScoreExist = scores.any((result) => result.studentId == studentId && result.courseId == courseId);
    if(!isScoreExist){
      throw Exception('score does not found in course');
    }

    scores.removeWhere((score) => score.studentId == studentId && score.courseId == courseId);
  }
  
  void addStudent({required String studentId, required String studentName}) {
    // ! Student shall not exist already
    Student? student = _findStudentOrNull(studentId);
    if (student != null) {
      throw Exception('Student $student already exists');
    }

    students.add(Student(id: studentId, name: studentName));
  }
 
  void removeStudentFromCourse ({required String studentId , required String courseId}){
    Course? course = findCourseOrNull(courseId);
    if(course == null){
      throw Exception('Course ${courseId} not found');
    }
    if(!course.studentIds.contains(studentId)){
      throw Exception('student $studentId does not enrolled to this course');
    }
    course.studentIds.removeWhere((student) => student == studentId);
    scores.removeWhere((result) => result.studentId == studentId && result.courseId == courseId);
  }

  void removeStudent({required String studentId}) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }
    // 1- Remove student from the students list
    students.removeWhere((student) => student.id == studentId);
    for(var c in courses){
      c.studentIds.removeWhere((id) => id == studentId);
    }
    scores.removeWhere((score) => score.studentId == studentId);
  }

  Student? _findStudentOrNull(String studentId) {
    for (Student s in students) {
      if (s.id == studentId) {
        return s;
      }
    }
    return null; // not found
  }

  Course? findCourseOrNull(String id){
    for(var c in courses){
      if(c.id == id){
        return c;
      }
    }
    return null;
  }

  
}
