import '../database.dart';

class OrdersTable extends SupabaseTable<OrdersRow> {
  @override
  String get tableName => 'orders';

  @override
  OrdersRow createRow(Map<String, dynamic> data) => OrdersRow(data);
}

class OrdersRow extends SupabaseDataRow {
  OrdersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrdersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get userId => getField<int>('userId')!;
  set userId(int value) => setField<int>('userId', value);

  double get totalPrice => getField<double>('totalPrice')!;
  set totalPrice(double value) => setField<double>('totalPrice', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  int get number => getField<int>('number')!;
  set number(int value) => setField<int>('number', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get surname => getField<String>('surname');
  set surname(String? value) => setField<String>('surname', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);
}
