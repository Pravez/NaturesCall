import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:nature_call/data/model/practitioner.dart';
import 'package:provider/provider.dart';

import '../blocs/home_bloc.dart';
import '../di/home_dependencies.dart';

class HomePage extends StatelessWidget implements AutoRouteWrapper {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => MultiProvider(
        providers: HomeDependencies.of(context).providers,
        child: this,
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(context),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildErrorListener(),
            Center(child: _buildDataContainer()),
          ],
        ),
      );

  AppBar _buildAppBar(BuildContext context) => AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<HomeBlocType>().events.fetchData("SaaCsJY4T3nkOM1sN0bP"),
          ),
        ],
      );

  Widget _buildDataContainer() => RxResultBuilder<HomeBlocType, Practitioner>(
        state: (bloc) => bloc.states.data,
        buildLoading: (ctx, bloc) => const CircularProgressIndicator(),
        buildError: (ctx, error, bloc) => const Text("error"),
        buildSuccess: (ctx, state, bloc) => Text(state.email),
      );

  Widget _buildErrorListener() => RxBlocListener<HomeBlocType, String>(
        state: (bloc) => bloc.states.errors,
        listener: (context, errorMessage) =>
            ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage ?? ''),
            behavior: SnackBarBehavior.floating,
          ),
        ),
      );
}
