import '../database.dart';

class ItemsTable extends SupabaseTable<ItemsRow> {
  @override
  String get tableName => 'items';

  @override
  ItemsRow createRow(Map<String, dynamic> data) => ItemsRow(data);
}

class ItemsRow extends SupabaseDataRow {
  ItemsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ItemsTable();

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  double get price => getField<double>('price')!;
  set price(double value) => setField<double>('price', value);

  String get category => getField<String>('category')!;
  set category(String value) => setField<String>('category', value);

  bool get isActive => getField<bool>('isActive')!;
  set isActive(bool value) => setField<bool>('isActive', value);

  String get imageUrl => getField<String>('imageUrl')!;
  set imageUrl(String value) => setField<String>('imageUrl', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  int get count => getField<int>('count')!;
  set count(int value) => setField<int>('count', value);
}
