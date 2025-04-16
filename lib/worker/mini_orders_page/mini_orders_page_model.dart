import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'mini_orders_page_widget.dart' show MiniOrdersPageWidget;
import 'package:flutter/material.dart';

class MiniOrdersPageModel extends FlutterFlowModel<MiniOrdersPageWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
