import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:nature_call/blocs/home/home_bloc.dart';

import '../model/practitioner.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter widget')),
      body: Center(
        child: RxBlocBuilder<HomeBlocType, Practitioner>(
          state: (b) => b.states.,
        )
      )
    );
  }

}