import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:nature_call/blocs/home/home_bloc.dart';
import 'package:nature_call/pages/home.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const NatureCallApp());
}

class NatureCallApp extends StatelessWidget {
  const NatureCallApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nature's call",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RxBlocProvider<HomeBlocType>(
        create: (ctx) => HomeBloc(),
        child: const HomePage(),
      ),
    );
  }
}
