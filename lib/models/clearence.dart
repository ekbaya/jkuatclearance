// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:student_clearance/models/account.dart';

class Clearance {
  final String id;
  final String title;
  final String description;
  final String filepath;
  final String studentId;
  final String status;
  final String chairmanStatus;
  final String chairmanComments;
  final String chairmanSignature;
  final String facultyStatus;
  final String facultyComments;
  final String libraryStatus;
  final String libraryComments;
  final String librarianSignature;
  final String houseKeeperStatus;
  final String houseKeeperComments;
  final String houseKeeperSignature;
  final String deanStatus;
  final String deanComments;
  final String deanSignature;
  final String sportsStatus;
  final String sportsComments;
  final String sportsSignature;
  final String registrarStatus;
  final String registrarComments;
  final String registrarSignature;
  final String financeStatus;
  final String financeComments;
  final String financeSignature;
  final Account student;
  Clearance({
    required this.id,
    required this.title,
    required this.description,
    required this.filepath,
    required this.studentId,
    required this.status,
    required this.chairmanStatus,
    required this.chairmanComments,
    required this.chairmanSignature,
    required this.facultyStatus,
    required this.facultyComments,
    required this.libraryStatus,
    required this.libraryComments,
    required this.librarianSignature,
    required this.houseKeeperStatus,
    required this.houseKeeperComments,
    required this.houseKeeperSignature,
    required this.deanStatus,
    required this.deanComments,
    required this.deanSignature,
    required this.sportsStatus,
    required this.sportsComments,
    required this.sportsSignature,
    required this.registrarStatus,
    required this.registrarComments,
    required this.registrarSignature,
    required this.financeStatus,
    required this.financeComments,
    required this.financeSignature,
    required this.student,
  });

  Clearance copyWith({
    String? id,
    String? title,
    String? description,
    String? filepath,
    String? studentId,
    String? status,
    String? chairmanStatus,
    String? chairmanComments,
    String? chairmanSignature,
    String? facultyStatus,
    String? facultyComments,
    String? libraryStatus,
    String? libraryComments,
    String? librarianSignature,
    String? houseKeeperStatus,
    String? houseKeeperComments,
    String? houseKeeperSignature,
    String? deanStatus,
    String? deanComments,
    String? deanSignature,
    String? sportsStatus,
    String? sportsComments,
    String? sportsSignature,
    String? registrarStatus,
    String? registrarComments,
    String? registrarSignature,
    String? financeStatus,
    String? financeComments,
    String? financeSignature,
    Account? student,
  }) {
    return Clearance(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      filepath: filepath ?? this.filepath,
      studentId: studentId ?? this.studentId,
      status: status ?? this.status,
      chairmanStatus: chairmanStatus ?? this.chairmanStatus,
      chairmanComments: chairmanComments ?? this.chairmanComments,
      chairmanSignature: chairmanSignature ?? this.chairmanSignature,
      facultyStatus: facultyStatus ?? this.facultyStatus,
      facultyComments: facultyComments ?? this.facultyComments,
      libraryStatus: libraryStatus ?? this.libraryStatus,
      libraryComments: libraryComments ?? this.libraryComments,
      librarianSignature: librarianSignature ?? this.librarianSignature,
      houseKeeperStatus: houseKeeperStatus ?? this.houseKeeperStatus,
      houseKeeperComments: houseKeeperComments ?? this.houseKeeperComments,
      houseKeeperSignature: houseKeeperSignature ?? this.houseKeeperSignature,
      deanStatus: deanStatus ?? this.deanStatus,
      deanComments: deanComments ?? this.deanComments,
      deanSignature: deanSignature ?? this.deanSignature,
      sportsStatus: sportsStatus ?? this.sportsStatus,
      sportsComments: sportsComments ?? this.sportsComments,
      sportsSignature: sportsSignature ?? this.sportsSignature,
      registrarStatus: registrarStatus ?? this.registrarStatus,
      registrarComments: registrarComments ?? this.registrarComments,
      registrarSignature: registrarSignature ?? this.registrarSignature,
      financeStatus: financeStatus ?? this.financeStatus,
      financeComments: financeComments ?? this.financeComments,
      financeSignature: financeSignature ?? this.financeSignature,
      student: student ?? this.student,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'filepath': filepath,
      'studentId': studentId,
      'status': status,
      'chairmanStatus': chairmanStatus,
      'chairmanComments': chairmanComments,
      'chairmanSignature': chairmanSignature,
      'facultyStatus': facultyStatus,
      'facultyComments': facultyComments,
      'libraryStatus': libraryStatus,
      'libraryComments': libraryComments,
      'librarianSignature': librarianSignature,
      'houseKeeperStatus': houseKeeperStatus,
      'houseKeeperComments': houseKeeperComments,
      'houseKeeperSignature': houseKeeperSignature,
      'deanStatus': deanStatus,
      'deanComments': deanComments,
      'deanSignature': deanSignature,
      'sportsStatus': sportsStatus,
      'sportsComments': sportsComments,
      'sportsSignature': sportsSignature,
      'registrarStatus': registrarStatus,
      'registrarComments': registrarComments,
      'registrarSignature': registrarSignature,
      'financeStatus': financeStatus,
      'financeComments': financeComments,
      'financeSignature': financeSignature,
      'student': student.toMap(),
    };
  }

  factory Clearance.fromMap(Map<dynamic, dynamic> map) {
    return Clearance(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      filepath: map['filepath'] as String,
      studentId: map['studentId'] as String,
      status: map['status'] as String,
      chairmanStatus: map['chairmanStatus'] as String,
      chairmanComments: map['chairmanComments'] as String,
      chairmanSignature: map['chairmanSignature'] ?? '',
      facultyStatus: map['facultyStatus'] as String,
      facultyComments: map['facultyComments'] as String,
      libraryStatus: map['libraryStatus'] as String,
      libraryComments: map['libraryComments'] as String,
      librarianSignature: map['librarianSignature'] ?? '',
      houseKeeperStatus: map['houseKeeperStatus'] as String,
      houseKeeperComments: map['houseKeeperComments'] as String,
      houseKeeperSignature: map['houseKeeperSignature'] ?? '',
      deanStatus: map['deanStatus'] as String,
      deanComments: map['deanComments'] as String,
      deanSignature: map['deanSignature'] ?? '',
      sportsStatus: map['sportsStatus'] as String,
      sportsComments: map['sportsComments'] as String,
      sportsSignature: map['sportsSignature'] ?? '',
      registrarStatus: map['registrarStatus'] as String,
      registrarComments: map['registrarComments'] as String,
      registrarSignature: map['registrarSignature'] ?? '',
      financeStatus: map['financeStatus'] as String,
      financeComments: map['financeComments'] as String,
      financeSignature: map['financeSignature'] ?? '',
      student: Account.fromMap(map['student'] as Map<dynamic, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Clearance.fromJson(String source) =>
      Clearance.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Clearance(id: $id, title: $title, description: $description, filepath: $filepath, studentId: $studentId, status: $status, chairmanStatus: $chairmanStatus, chairmanComments: $chairmanComments, chairmanSignature: $chairmanSignature, facultyStatus: $facultyStatus, facultyComments: $facultyComments, libraryStatus: $libraryStatus, libraryComments: $libraryComments, librarianSignature: $librarianSignature, houseKeeperStatus: $houseKeeperStatus, houseKeeperComments: $houseKeeperComments, houseKeeperSignature: $houseKeeperSignature, deanStatus: $deanStatus, deanComments: $deanComments, deanSignature: $deanSignature, sportsStatus: $sportsStatus, sportsComments: $sportsComments, sportsSignature: $sportsSignature, registrarStatus: $registrarStatus, registrarComments: $registrarComments, registrarSignature: $registrarSignature, financeStatus: $financeStatus, financeComments: $financeComments, financeSignature: $financeSignature, student: $student)';
  }

  @override
  bool operator ==(covariant Clearance other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.filepath == filepath &&
        other.studentId == studentId &&
        other.status == status &&
        other.chairmanStatus == chairmanStatus &&
        other.chairmanComments == chairmanComments &&
        other.chairmanSignature == chairmanSignature &&
        other.facultyStatus == facultyStatus &&
        other.facultyComments == facultyComments &&
        other.libraryStatus == libraryStatus &&
        other.libraryComments == libraryComments &&
        other.librarianSignature == librarianSignature &&
        other.houseKeeperStatus == houseKeeperStatus &&
        other.houseKeeperComments == houseKeeperComments &&
        other.houseKeeperSignature == houseKeeperSignature &&
        other.deanStatus == deanStatus &&
        other.deanComments == deanComments &&
        other.deanSignature == deanSignature &&
        other.sportsStatus == sportsStatus &&
        other.sportsComments == sportsComments &&
        other.sportsSignature == sportsSignature &&
        other.registrarStatus == registrarStatus &&
        other.registrarComments == registrarComments &&
        other.registrarSignature == registrarSignature &&
        other.financeStatus == financeStatus &&
        other.financeComments == financeComments &&
        other.financeSignature == financeSignature &&
        other.student == student;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        filepath.hashCode ^
        studentId.hashCode ^
        status.hashCode ^
        chairmanStatus.hashCode ^
        chairmanComments.hashCode ^
        chairmanSignature.hashCode ^
        facultyStatus.hashCode ^
        facultyComments.hashCode ^
        libraryStatus.hashCode ^
        libraryComments.hashCode ^
        librarianSignature.hashCode ^
        houseKeeperStatus.hashCode ^
        houseKeeperComments.hashCode ^
        houseKeeperSignature.hashCode ^
        deanStatus.hashCode ^
        deanComments.hashCode ^
        deanSignature.hashCode ^
        sportsStatus.hashCode ^
        sportsComments.hashCode ^
        sportsSignature.hashCode ^
        registrarStatus.hashCode ^
        registrarComments.hashCode ^
        registrarSignature.hashCode ^
        financeStatus.hashCode ^
        financeComments.hashCode ^
        financeSignature.hashCode ^
        student.hashCode;
  }
}
