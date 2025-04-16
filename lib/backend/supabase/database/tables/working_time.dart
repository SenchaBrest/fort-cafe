import '../database.dart';

class WorkingTimeTable extends SupabaseTable<WorkingTimeRow> {
  @override
  String get tableName => 'workingTime';

  @override
  WorkingTimeRow createRow(Map<String, dynamic> data) => WorkingTimeRow(data);
}

class WorkingTimeRow extends SupabaseDataRow {
  WorkingTimeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WorkingTimeTable();

  String get day => getField<String>('day')!;
  set day(String value) => setField<String>('day', value);

  PostgresTime? get from => getField<PostgresTime>('from');
  set from(PostgresTime? value) => setField<PostgresTime>('from', value);

  PostgresTime? get to => getField<PostgresTime>('to');
  set to(PostgresTime? value) => setField<PostgresTime>('to', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  bool get isActive => getField<bool>('isActive')!;
  set isActive(bool value) => setField<bool>('isActive', value);
}
