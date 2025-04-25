import '/backend/supabase/supabase.dart';
import '/components/empty_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'order_page_widget.dart' show OrderPageWidget;
import 'package:flutter/material.dart';

class OrderPageModel extends FlutterFlowModel<OrderPageWidget> {
  ///  Local state fields for this page.

  bool showOrderButton = true;

  ///  State fields for stateful widgets in this page.

  Stream<List<ItemsRow>>? containerSupabaseStream;
  // Models for empty dynamic component.
  late FlutterFlowDynamicModels<EmptyModel> emptyModels;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? userInfo;

  @override
  void initState(BuildContext context) {
    emptyModels = FlutterFlowDynamicModels(() => EmptyModel());
  }

  @override
  void dispose() {
    emptyModels.dispose();
  }
}
