// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'home_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class HomeBlocType extends RxBlocTypeBase {
  HomeBlocEvents get events;
  HomeBlocStates get states;
}

/// [$HomeBloc] extended by the [HomeBloc]
/// {@nodoc}
abstract class $HomeBloc extends RxBlocBase
    implements HomeBlocEvents, HomeBlocStates, HomeBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [fetchData]
  final _$fetchDataEvent = PublishSubject<String>();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<String> _errorsState = _mapToErrorsState();

  /// The state of [data] implemented in [_mapToDataState]
  late final Stream<Result<Practitioner>> _dataState = _mapToDataState();

  /// The state of [isLoading] implemented in [_mapToIsLoadingState]
  late final Stream<LoadingWithTag> _isLoadingState = _mapToIsLoadingState();

  @override
  void fetchData(String practitionerId) => _$fetchDataEvent.add(practitionerId);

  @override
  Stream<String> get errors => _errorsState;

  @override
  Stream<Result<Practitioner>> get data => _dataState;

  @override
  Stream<LoadingWithTag> get isLoading => _isLoadingState;

  Stream<String> _mapToErrorsState();

  Stream<Result<Practitioner>> _mapToDataState();

  Stream<LoadingWithTag> _mapToIsLoadingState();

  @override
  HomeBlocEvents get events => this;

  @override
  HomeBlocStates get states => this;

  @override
  void dispose() {
    _$fetchDataEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
