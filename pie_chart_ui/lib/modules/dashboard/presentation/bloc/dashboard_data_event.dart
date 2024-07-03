part of 'dashboard_data_bloc.dart';

@immutable
sealed class DashboardDataEvent {}
class UpdateDataEvent extends DashboardDataEvent{
  final List<String> ColumnNames;
  final List<String> value;

  UpdateDataEvent({required this.ColumnNames, required this.value});
}