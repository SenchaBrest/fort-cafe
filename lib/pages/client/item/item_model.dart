import '/components/empty_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'item_widget.dart' show ItemWidget;
import 'package:flutter/material.dart';

class ItemModel extends FlutterFlowModel<ItemWidget> {
  ///  Local state fields for this component.

  int count = 0;

  ///  State fields for stateful widgets in this component.

  // Model for empty component.
  late EmptyModel emptyModel;

  @override
  void initState(BuildContext context) {
    emptyModel = createModel(context, () => EmptyModel());
  }

  @override
  void dispose() {
    emptyModel.dispose();
  }
}
