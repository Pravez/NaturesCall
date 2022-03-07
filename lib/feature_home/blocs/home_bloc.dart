import 'package:nature_call/data/model/practitioner.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'home_bloc.rxb.g.dart';

part 'home_bloc_extensions.dart';

abstract class HomeBlocEvents {
  void fetchData(String practitionerId);
}

abstract class HomeBlocStates {
  Stream<String> get errors;

  Stream<Result<Practitioner>> get data;
}

@RxBloc()
class HomeBloc extends $HomeBloc {
  @override
  Stream<Result<Practitioner>> _mapToDataState() => _$fetchDataEvent
      .mapToData()
      .setResultStateHandler(this)
      .shareReplay(maxSize: 1);

  @override
  Stream<String> _mapToErrorsState() => errorState.toMessage();

  @override
  Stream<LoadingWithTag> _mapToIsLoadingState() => loadingWithTagState;
}
