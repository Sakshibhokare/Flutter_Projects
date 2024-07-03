// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pi_chart/bloc/data_bloc.dart';
import 'package:pi_chart/bloc/data_state.dart';  
import 'package:pi_chart/screens/pie_chart_screen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<DataBloc>( 
        create: (context) => DataBloc(),
        child: PieChartScreen(),
      ),
    );
  }
}
