import 'package:nature_call/data/model/patient.dart';
import 'package:nature_call/data/model/practitioner.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'home_bloc.rxb.g.dart';

part 'home_bloc_extensions.dart';

/// A contract class containing all events of the HomeBloC.
abstract class HomeBlocEvents {
  /// TODO: Document the event
  void fetchData(String practitionerId);
}

/// A contract class containing all states of the HomeBloC.
abstract class HomeBlocStates {
  /// The error state
  Stream<String> get errors;

  Stream<Result<Practitioner>> get data;

  Stream<LoadingWithTag> get isLoading;
}

@RxBloc()
class HomeBloc extends $HomeBloc {

  @override
  Stream<Result<Practitioner>> _mapToDataState() => _$fetchDataEvent
      .startWith("SaaCsJY4T3nkOM1sN0bP")
      .mapToData()
      .setResultStateHandler(this)
      .shareReplay(maxSize: 1);

  @override
  Stream<String> _mapToErrorsState() => errorState.toMessage();

  @override
  Stream<LoadingWithTag> _mapToIsLoadingState() => loadingWithTagState;
}
