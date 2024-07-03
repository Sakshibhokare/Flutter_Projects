// pie_chart_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pi_chart/bloc/data_bloc.dart';
import 'package:pi_chart/bloc/data_state.dart';

class PieChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        if (state is DataLoadedState) {
          return PieChart(
            PieChartData(
              centerSpaceRadius: 50,
              sectionsSpace: 0,
              sections: List.generate(

                state.data.length,
                (index) => PieChartSectionData(

                  value: state.data[index].value,
                  title: state.data[index].label,
                  color: Colors.accents[index % Colors.accents.length],
                ),
              ),
            ),
          );
        }
        return Container(); // Placeholder or loading indicator
      },
    );
  }
}
