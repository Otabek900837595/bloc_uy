import 'package:bloc_uy/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_patternnbloc/bloc/home_cubit.dart';
// import 'package:flutter_patternnbloc/pages/homePage.dart';
// import 'package:flutter_patternnbloc/pages/home_page.dart';

import 'bloc/home_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) => ListPostCubit(),
        child: const HomePage(),
      ),
    );
  }
}

