part of 'home_bloc.dart';

/// TODO: Here you can add the implementation details of your BloC or any stream extensions you might need.
/// Thus, the BloC will contain only declarations, which improves the readability and the maintainability.
extension _HomeExtension on HomeBloc {}

extension _ToError on Stream<Exception> {
  /// TODO: Implement error event-to-state logic
  Stream<String> toMessage() => map((errorState) => errorState.toString());
}

extension _MapFetchEventToData on Stream<String> {
  Stream<Result<Practitioner>> mapToData() => throttleTime(
        const Duration(milliseconds: 200),
      ).switchMap((value) => practitionersRef.doc(value).get().asStream().map(
          (event) => event.exists
              ? Result.success(event.data!)
              : Result.error(Exception("Failed"))));
}
