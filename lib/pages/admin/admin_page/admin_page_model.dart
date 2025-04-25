import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/admin/item_edit/item_edit_widget.dart';
import '/index.dart';
import 'admin_page_widget.dart' show AdminPageWidget;
import 'package:flutter/material.dart';

class AdminPageModel extends FlutterFlowModel<AdminPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> cart = [];
  void addToCart(dynamic item) => cart.add(item);
  void removeFromCart(dynamic item) => cart.remove(item);
  void removeAtIndexFromCart(int index) => cart.removeAt(index);
  void insertAtIndexInCart(int index, dynamic item) => cart.insert(index, item);
  void updateCartAtIndex(int index, Function(dynamic) updateFn) =>
      cart[index] = updateFn(cart[index]);

  ///  State fields for stateful widgets in this page.

  Stream<List<ItemsRow>>? adminPageSupabaseStream;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Models for itemEdit dynamic component.
  late FlutterFlowDynamicModels<ItemEditModel> itemEditModels;
  Stream<List<FlagsRow>>? containerSupabaseStream;
  // State field(s) for Switch widget.
  bool? switchValue;
  Stream<List<UsersRow>>? listViewSupabaseStream;

  @override
  void initState(BuildContext context) {
    itemEditModels = FlutterFlowDynamicModels(() => ItemEditModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    itemEditModels.dispose();
  }
}
