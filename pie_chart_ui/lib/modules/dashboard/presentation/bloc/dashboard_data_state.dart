part of 'dashboard_data_bloc.dart';

@immutable
sealed class DashboardDataState {}

final class DashboardDataInitial extends DashboardDataState {}

class dashboardLoading extends DashboardDataState{}

class dashboardEmpty extends DashboardDataState{}

class GraphDataSuccess extends DashboardDataState{
  final List<String> ColumnNames;
  final List<String> value;

  GraphDataSuccess({required this.ColumnNames, required this.value});
}