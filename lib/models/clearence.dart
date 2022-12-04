// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Clearance {
  final String id;
  final String title;
  final String description;
  final String filepath;
  final String studentId;
  final String status;
  final String chairmanStatus;
  final String chairmanComments;
  final String facultyStatus;
  final String facultyComments;
  final String libraryStatus;
  final String libraryComments;
  final String houseKeeperStatus;
  final String houseKeeperComments;
  final String deanStatus;
  final String deanComments;
  final String sportsStatus;
  final String sportsComments;
  final String registrarStatus;
  final String registrarComments;
  final String financeStatus;
  final String financeComments;
  Clearance({
    required this.id,
    required this.title,
    required this.description,
    required this.filepath,
    required this.studentId,
    required this.status,
    required this.chairmanStatus,
    required this.chairmanComments,
    required this.facultyStatus,
    required this.facultyComments,
    required this.libraryStatus,
    required this.libraryComments,
    required this.houseKeeperStatus,
    required this.houseKeeperComments,
    required this.deanStatus,
    required this.deanComments,
    required this.sportsStatus,
    required this.sportsComments,
    required this.registrarStatus,
    required this.registrarComments,
    required this.financeStatus,
    required this.financeComments,
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
    String? facultyStatus,
    String? facultyComments,
    String? libraryStatus,
    String? libraryComments,
    String? houseKeeperStatus,
    String? houseKeeperComments,
    String? deanStatus,
    String? deanComments,
    String? sportsStatus,
    String? sportsComments,
    String? registrarStatus,
    String? registrarComments,
    String? financeStatus,
    String? financeComments,
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
      facultyStatus: facultyStatus ?? this.facultyStatus,
      facultyComments: facultyComments ?? this.facultyComments,
      libraryStatus: libraryStatus ?? this.libraryStatus,
      libraryComments: libraryComments ?? this.libraryComments,
      houseKeeperStatus: houseKeeperStatus ?? this.houseKeeperStatus,
      houseKeeperComments: houseKeeperComments ?? this.houseKeeperComments,
      deanStatus: deanStatus ?? this.deanStatus,
      deanComments: deanComments ?? this.deanComments,
      sportsStatus: sportsStatus ?? this.sportsStatus,
      sportsComments: sportsComments ?? this.sportsComments,
      registrarStatus: registrarStatus ?? this.registrarStatus,
      registrarComments: registrarComments ?? this.registrarComments,
      financeStatus: financeStatus ?? this.financeStatus,
      financeComments: financeComments ?? this.financeComments,
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
      'facultyStatus': facultyStatus,
      'facultyComments': facultyComments,
      'libraryStatus': libraryStatus,
      'libraryComments': libraryComments,
      'houseKeeperStatus': houseKeeperStatus,
      'houseKeeperComments': houseKeeperComments,
      'deanStatus': deanStatus,
      'deanComments': deanComments,
      'sportsStatus': sportsStatus,
      'sportsComments': sportsComments,
      'registrarStatus': registrarStatus,
      'registrarComments': registrarComments,
      'financeStatus': financeStatus,
      'financeComments': financeComments,
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
      facultyStatus: map['facultyStatus'] as String,
      facultyComments: map['facultyComments'] as String,
      libraryStatus: map['libraryStatus'] as String,
      libraryComments: map['libraryComments'] as String,
      houseKeeperStatus: map['houseKeeperStatus'] as String,
      houseKeeperComments: map['houseKeeperComments'] as String,
      deanStatus: map['deanStatus'] as String,
      deanComments: map['deanComments'] as String,
      sportsStatus: map['sportsStatus'] as String,
      sportsComments: map['sportsComments'] as String,
      registrarStatus: map['registrarStatus'] as String,
      registrarComments: map['registrarComments'] as String,
      financeStatus: map['financeStatus'] as String,
      financeComments: map['financeComments'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Clearance.fromJson(String source) =>
      Clearance.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Clearance(id: $id, title: $title, description: $description, filepath: $filepath, studentId: $studentId, status: $status, chairmanStatus: $chairmanStatus, chairmanComments: $chairmanComments, facultyStatus: $facultyStatus, facultyComments: $facultyComments, libraryStatus: $libraryStatus, libraryComments: $libraryComments, houseKeeperStatus: $houseKeeperStatus, houseKeeperComments: $houseKeeperComments, deanStatus: $deanStatus, deanComments: $deanComments, sportsStatus: $sportsStatus, sportsComments: $sportsComments, registrarStatus: $registrarStatus, registrarComments: $registrarComments, financeStatus: $financeStatus, financeComments: $financeComments)';
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
        other.facultyStatus == facultyStatus &&
        other.facultyComments == facultyComments &&
        other.libraryStatus == libraryStatus &&
        other.libraryComments == libraryComments &&
        other.houseKeeperStatus == houseKeeperStatus &&
        other.houseKeeperComments == houseKeeperComments &&
        other.deanStatus == deanStatus &&
        other.deanComments == deanComments &&
        other.sportsStatus == sportsStatus &&
        other.sportsComments == sportsComments &&
        other.registrarStatus == registrarStatus &&
        other.registrarComments == registrarComments &&
        other.financeStatus == financeStatus &&
        other.financeComments == financeComments;
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
        facultyStatus.hashCode ^
        facultyComments.hashCode ^
        libraryStatus.hashCode ^
        libraryComments.hashCode ^
        houseKeeperStatus.hashCode ^
        houseKeeperComments.hashCode ^
        deanStatus.hashCode ^
        deanComments.hashCode ^
        sportsStatus.hashCode ^
        sportsComments.hashCode ^
        registrarStatus.hashCode ^
        registrarComments.hashCode ^
        financeStatus.hashCode ^
        financeComments.hashCode;
  }
}
