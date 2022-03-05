import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nature_call/data/model/patient.dart';
import 'package:nature_call/data/model/validators/email_validator.dart';

part 'practitioner.g.dart';

@JsonSerializable()
class Practitioner {
  Practitioner({
    required this.name,
    required this.age,
    required this.email,
  }) {
    _$assertPractitioner(this);
  }

  final String name;
  final int age;

  @EmailValidator()
  final String email;

  factory Practitioner.fromJson(Map<String, Object?> json) =>
      _$PractitionerFromJson(json);

  Map<String, Object?> toJson() => _$PractitionerToJson(this);
}

@Collection<Practitioner>("practitioners")
@Collection<Patient>("practitioners/*/patients")
final practitionersRef = PractitionerCollectionReference();
