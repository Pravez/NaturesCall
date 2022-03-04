import 'package:nature_call/model/practitioner.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'home_bloc.rxb.g.dart';
part 'home_bloc_extensions.dart';

/// A contract class containing all events of the HomeBloC.
abstract class HomeBlocEvents {
  /// TODO: Document the event
  void fetchData();
}

/// A contract class containing all states of the HomeBloC.
abstract class HomeBlocStates {
  /// The loading state
  Stream<bool> get isLoading;

  /// The error state
  Stream<String> get errors;

  Stream<Result<Practitioner>> get data;
}

@RxBloc()
class HomeBloc extends $HomeBloc {
  @override
  Stream<Result<Practitioner>> _mapToDataState() => _$fetchDataEvent
      .startWith(null)
      .mapToData()
      .setResultStateHandler(this)
      .shareReplay(maxSize: 1);

  @override Stream<String> _mapToErrorsState() =>
         errorState.toMessage();

  @override
  Stream<bool> _mapToIsLoadingState() => loadingState;
}
