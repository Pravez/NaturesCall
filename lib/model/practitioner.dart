import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nature_call/model/patient.dart';
import 'package:nature_call/model/validators/email_validator.dart';

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
}

@Collection<Practitioner>("practitioners")
final practitionersRef = PractitionerCollectionReference();
