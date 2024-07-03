import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pi_chart/modules/dashboard/data/model/data_model.dart';

part 'dashboard_data_event.dart';
part 'dashboard_data_state.dart';

class DashboardDataBloc extends Bloc<DashboardDataEvent, DashboardDataState> {
  DashboardDataBloc() : super(DashboardDataInitial()) {
    on<UpdateDataEvent>( _onUpdateDataEvent);
  }

  FutureOr<void> _onUpdateDataEvent(UpdateDataEvent event, Emitter<DashboardDataState> emit) {
    emit(GraphDataSuccess(ColumnNames: event.ColumnNames, value: event.value));
  }
}
