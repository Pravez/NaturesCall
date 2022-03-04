part of 'home_bloc.dart';

/// TODO: Here you can add the implementation details of your BloC or any stream extensions you might need.
/// Thus, the BloC will contain only declarations, which improves the readability and the maintainability.
extension _HomeExtension on HomeBloc {}

extension _ToError on Stream<Exception> {
  /// TODO: Implement error event-to-state logic
  Stream<String> toMessage() => map((errorState) => errorState.toString());
}

extension _MapFetchEventToData on Stream<void> {
  Stream<Result<Practitioner>> mapToData(/*{required DataRepository repository}*/) async* {
        ///TODO: Replace the code below with a repository invocation
        /// Example: (value) => repository.getData().asResultStream()
        yield Result<Practitioner>.loading();
        yield practitionersRef.doc("test").get().asStream().map((event) => event.)
        yield Result<Practitioner>.success('Some specific async state');
      }
}