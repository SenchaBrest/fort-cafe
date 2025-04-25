import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/client/item/item_widget.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<dynamic> cart = [];
  void addToCart(dynamic item) => cart.add(item);
  void removeFromCart(dynamic item) => cart.remove(item);
  void removeAtIndexFromCart(int index) => cart.removeAt(index);
  void insertAtIndexInCart(int index, dynamic item) => cart.insert(index, item);
  void updateCartAtIndex(int index, Function(dynamic) updateFn) =>
      cart[index] = updateFn(cart[index]);

  ///  State fields for stateful widgets in this page.

  Stream<List<ItemsRow>>? homePageSupabaseStream;
  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<UsersRow>? role;
  Stream<List<FlagsRow>>? stackSupabaseStream;
  // Models for item dynamic component.
  late FlutterFlowDynamicModels<ItemModel> itemModels;

  @override
  void initState(BuildContext context) {
    itemModels = FlutterFlowDynamicModels(() => ItemModel());
  }

  @override
  void dispose() {
    itemModels.dispose();
  }
}
