// pie_chart_screen.dart
// pie_chart_screen.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pi_chart/modules/dashboard/data/model/data_model.dart';
import 'package:pi_chart/modules/dashboard/presentation/bloc/dashboard_data_bloc.dart';
import 'package:pi_chart/widgets/pie_chart_widget.dart';

class PieChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DashboardDataBloc dataBloc = BlocProvider.of<DashboardDataBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Pie Chart'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Load data from JSON file
                  loadPieChartData().then((newData) {
                    dataBloc.add(UpdateDataEvent(newData));
                  });
                },
                child: Text('Update Data'),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 500,
                width: 500,
                child: BlocProvider<DashboardDataBloc>.value(
                  value: dataBloc,
                  child: PieChartWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<DataModel>> loadPieChartData() async {
    // Load JSON file from assets
    String data = await rootBundle.loadString('assets/pie_chart_data.json');
    List<dynamic> jsonList = json.decode(data);

    // Convert JSON data to DataModel list
    List<DataModel> newData = jsonList
        .map((item) => DataModel(item['category'], item['value']))
        .toList();

    return newData;
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pi_chart/bloc/data_bloc.dart';
// import 'package:pi_chart/bloc/data_event.dart';
// import 'package:pi_chart/bloc/data_state.dart';
// import 'package:pi_chart/models/data_model.dart';
// import 'package:pi_chart/widgets/pie_chart_widget.dart';

// class PieChartScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final DataBloc dataBloc = BlocProvider.of<DataBloc>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dynamic Pie Chart'),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Example: Updating data in response to button press
//                   List<DataModel> newData = [
//                     DataModel('Category A', 30),
//                     DataModel('Category B', 20),
//                     DataModel('Category C', 50),
//                   ];
//                   dataBloc.add(UpdateDataEvent(newData));
//                 },
//                 child: Text('Update Data'),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 height: 500,
//                 width: 500,
//                 child: BlocProvider<DataBloc>.value(
//                   value: dataBloc,
//                   child: PieChartWidget(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
