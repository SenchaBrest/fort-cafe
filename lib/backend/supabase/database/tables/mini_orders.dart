import '../database.dart';

class MiniOrdersTable extends SupabaseTable<MiniOrdersRow> {
  @override
  String get tableName => 'miniOrders';

  @override
  MiniOrdersRow createRow(Map<String, dynamic> data) => MiniOrdersRow(data);
}

class MiniOrdersRow extends SupabaseDataRow {
  MiniOrdersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MiniOrdersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get orderId => getField<String>('orderId')!;
  set orderId(String value) => setField<String>('orderId', value);

  String get itemId => getField<String>('itemId')!;
  set itemId(String value) => setField<String>('itemId', value);

  int get quantity => getField<int>('quantity')!;
  set quantity(int value) => setField<int>('quantity', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
