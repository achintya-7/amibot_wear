// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClassSchedule {
  final String courseCode;
  final String courseName;
  final String time;
  final String faculty;
  final int attendance;
  ClassSchedule({
    required this.courseCode,
    required this.courseName,
    required this.time,
    required this.faculty,
    required this.attendance,
  });

  ClassSchedule copyWith({
    String? courseCode,
    String? courseName,
    String? time,
    String? faculty,
  }) {
    return ClassSchedule(
      attendance: attendance,
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      time: time ?? this.time,
      faculty: faculty ?? this.faculty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courseCode': courseCode,
      'courseName': courseName,
      'time': time,
      'faculty': faculty,
    };
  }

  factory ClassSchedule.fromMap(Map<String, dynamic> map) {
    return ClassSchedule(
      attendance: map['attendance'] as int,
      courseCode: map['courseCode'] as String,
      courseName: map['courseName'] as String,
      time: map['time'] as String,
      faculty: map['faculty'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassSchedule.fromJson(String source) => ClassSchedule.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClassSchedule(courseCode: $courseCode, courseName: $courseName, time: $time, faculty: $faculty)';
  }

  @override
  bool operator ==(covariant ClassSchedule other) {
    if (identical(this, other)) return true;

    return other.courseCode == courseCode && other.courseName == courseName && other.time == time && other.faculty == faculty;
  }

  @override
  int get hashCode {
    return courseCode.hashCode ^ courseName.hashCode ^ time.hashCode ^ faculty.hashCode;
  }
}
