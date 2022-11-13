// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Account {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String institute;
  final String department;
  final String role;
  final String registrationNo;
  final String yearAndLevel;
  Account({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.institute,
    required this.department,
    required this.role,
    required this.registrationNo,
    required this.yearAndLevel,
  });

  Account copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? institute,
    String? department,
    String? role,
    String? registrationNo,
    String? yearAndLevel,
  }) {
    return Account(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      institute: institute ?? this.institute,
      department: department ?? this.department,
      role: role ?? this.role,
      registrationNo: registrationNo ?? this.registrationNo,
      yearAndLevel: yearAndLevel ?? this.yearAndLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'institute': institute,
      'department': department,
      'role': role,
      'registrationNo': registrationNo,
      'yearAndLevel': yearAndLevel,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      firstName: map['firstName'] ?? "",
      lastName: map['lastName'] ?? "",
      email: map['email'] ?? "",
      phone: map['phone'] ?? "",
      institute: map['institute'] ?? "",
      department: map['department'] ?? "",
      role: map['role'] ?? "",
      registrationNo: map['registrationNo'] ?? "",
      yearAndLevel: map['yearAndLevel'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Account(firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, institute: $institute, department: $department, role: $role, registrationNo: $registrationNo, yearAndLevel: $yearAndLevel)';
  }

  @override
  bool operator ==(covariant Account other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.phone == phone &&
        other.institute == institute &&
        other.department == department &&
        other.role == role &&
        other.registrationNo == registrationNo &&
        other.yearAndLevel == yearAndLevel;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        institute.hashCode ^
        department.hashCode ^
        role.hashCode ^
        registrationNo.hashCode ^
        yearAndLevel.hashCode;
  }
}
