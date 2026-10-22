import 'package:test/test.dart';

import '../lib/service/lms_system.dart';

void main() {
  test('creates a student', () {
    final lms = LmsSystem();

    // Create a student
    lms.addStudent(studentId: 'S1', studentName: "ronan");

    expect(lms.students.first.name, 'ronan');

    // Remove the student
    lms.removeStudent(studentId: 'S1');
    expect(lms.students.length, 0);
  });

  // test('creates a course', () {
  //   final lms = LmsSystem();

  //   lms.createCourse(id: 'C1', name: 'Dart');

  //   expect(lms.courses.length, 1);
  //   expect(lms.courses.first.id, 'C1');
  //   expect(lms.courses.first.name, 'Dart');
  // });

  // test('rejects duplicate course id', () {
  //   final lms = LmsSystem();

  //   lms.createCourse(id: 'C1', name: 'Dart');

  //   expect(() => lms.createCourse(id: 'C1', name: 'Flutter'), throwsException);
  // });


  // test('enrolls student in a course', () {
  //   final lms = LmsSystem();

  //   lms.addStudent(studentId: 'S1', studentName: 'Ronan');
  //   lms.createCourse(id: 'C1', name: 'Dart');

  //   lms.enrollStudent(studentId: 'S1', courseId: 'C1');

  //   expect(lms.courses.first.studentIds, contains('S1'));
  // });

  // test('rejects duplicate enrolled student', () {
  //   final lms = LmsSystem();

  //   lms.addStudent(studentId: 'S1', studentName: 'Ronan');
  //   lms.createCourse(id: 'C1', name: 'Dart');
  //   lms.enrollStudent(studentId: 'S1', courseId: 'C1');

  //   expect(
  //     () => lms.enrollStudent(studentId: 'S1', courseId: 'C1'),
  //     throwsException,
  //   );
  // });

  // test('adds score for an enrolled student', () {
  //   final lms = LmsSystem();

  //   lms.addStudent(studentId: 'S1', studentName: 'Ronan');
  //   lms.createCourse(id: 'C1', name: 'Dart');
  //   lms.enrollStudent(studentId: 'S1', courseId: 'C1');

  //   lms.addScore(studentId: 'S1', courseId: 'C1', score: 85);

  //   expect(lms.scores.length, 1);
  //   expect(lms.scores.first.studentId, 'S1');
  //   expect(lms.scores.first.courseId, 'C1');
  //   expect(lms.scores.first.score, 85);
  // });

  // test('rejects score outside the valid range', () {
  //   final lms = LmsSystem();

  //   lms.addStudent(studentId: 'S1', studentName: 'Ronan');
  //   lms.createCourse(id: 'C1', name: 'Dart');
  //   lms.enrollStudent(studentId: 'S1', courseId: 'C1');

  //   expect(() => lms.addScore(studentId: 'S1',courseId: 'C1',score: 101,) , throwsException);
  // });

  // test('remove a student from course', () {
  //   final lms = LmsSystem();

  //   lms.addStudent(studentId: 'S1', studentName: 'Ronan');
  //   lms.createCourse(id: 'C1', name: 'Dart');
  //   lms.enrollStudent(studentId: 'S1', courseId: 'C1');

  //   lms.removeStudentFromCourse(studentId: 'S1', courseId: 'C1');

  //   expect(lms.courses.first.studentIds, isNot(contains('S1')));
  // });

  // test('removes a course with no enrolled students and scores', () {
  //   final lms = LmsSystem();

  //   lms.createCourse(id: 'C1', name: 'Dart');
  //   lms.removeCourse(courseId: 'C1');
  //   expect(lms.courses.length, 0);
  // });

  // test('rejects remove course that have enrolled students', () {
  //   final lms = LmsSystem();

  //   lms.addStudent(studentId: 'S1', studentName: 'Ronan');
  //   lms.createCourse(id: 'C1', name: 'Dart');
  //   lms.enrollStudent(studentId: 'S1', courseId: 'C1');

  //   expect(() => lms.removeCourse(courseId: 'C1'),throwsException);
  // });  
}
