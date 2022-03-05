import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nature_call/data/model/validators/email_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'patient.g.dart';

@JsonSerializable()
class Patient {
  Patient({
    required this.name,
    required this.age,
    required this.email,
  }) {
    _$assertPatient(this);
  }

  final String name;
  final int age;

  @EmailValidator()
  final String email;

  factory Patient.fromJson(Map<String, Object?> json) =>
      _$PatientFromJson(json);

  Map<String, Object?> toJson() => _$PatientToJson(this);
}

@Collection<Patient>("patients")
final patientsRef = PatientCollectionReference();
