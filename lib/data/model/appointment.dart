import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment {
  Appointment(
      {required this.patientId,
      required this.practitionerId,
      required this.startDate,
      required this.endDate}) {
    if (startDate.isAfter(endDate)) {
      throw Exception("Beginning must be before ending.");
    }
  }

  final String patientId;
  final String practitionerId;

  final DateTime startDate;
  final DateTime endDate;
}

@Collection<Appointment>("appointments")
final appointmentsRef = AppointmentCollectionReference();
