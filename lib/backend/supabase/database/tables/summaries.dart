import '../database.dart';

class SummariesTable extends SupabaseTable<SummariesRow> {
  @override
  String get tableName => 'summaries';

  @override
  SummariesRow createRow(Map<String, dynamic> data) => SummariesRow(data);
}

class SummariesRow extends SupabaseDataRow {
  SummariesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SummariesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get summary => getField<String>('summary')!;
  set summary(String value) => setField<String>('summary', value);

  String? get orderId => getField<String>('orderId');
  set orderId(String? value) => setField<String>('orderId', value);
}
