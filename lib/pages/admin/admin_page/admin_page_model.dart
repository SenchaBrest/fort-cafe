import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/admin/item_edit/item_edit_widget.dart';
import '/index.dart';
import 'admin_page_widget.dart' show AdminPageWidget;
import 'dart:async';
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

  Completer<ApiCallResponse>? apiRequestCompleter;
  Completer<List<FlagsRow>>? requestCompleter1;
  Completer<List<UsersRow>>? requestCompleter2;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Models for itemEdit dynamic component.
  late FlutterFlowDynamicModels<ItemEditModel> itemEditModels;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {
    itemEditModels = FlutterFlowDynamicModels(() => ItemEditModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    itemEditModels.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
