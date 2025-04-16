import '../database.dart';

class FlagsTable extends SupabaseTable<FlagsRow> {
  @override
  String get tableName => 'flags';

  @override
  FlagsRow createRow(Map<String, dynamic> data) => FlagsRow(data);
}

class FlagsRow extends SupabaseDataRow {
  FlagsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FlagsTable();

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  bool get isField => getField<bool>('is')!;
  set isField(bool value) => setField<bool>('is', value);
}
