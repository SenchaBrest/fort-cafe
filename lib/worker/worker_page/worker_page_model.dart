import '/flutter_flow/flutter_flow_util.dart';
import '/worker/tab1/tab1_widget.dart';
import '/worker/tab2/tab2_widget.dart';
import '/worker/tab3/tab3_widget.dart';
import '/index.dart';
import 'worker_page_widget.dart' show WorkerPageWidget;
import 'package:flutter/material.dart';

class WorkerPageModel extends FlutterFlowModel<WorkerPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> cart = [];
  void addToCart(dynamic item) => cart.add(item);
  void removeFromCart(dynamic item) => cart.remove(item);
  void removeAtIndexFromCart(int index) => cart.removeAt(index);
  void insertAtIndexInCart(int index, dynamic item) => cart.insert(index, item);
  void updateCartAtIndex(int index, Function(dynamic) updateFn) =>
      cart[index] = updateFn(cart[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for tab1 component.
  late Tab1Model tab1Model;
  // Model for tab2 component.
  late Tab2Model tab2Model;
  // Model for tab3 component.
  late Tab3Model tab3Model;

  @override
  void initState(BuildContext context) {
    tab1Model = createModel(context, () => Tab1Model());
    tab2Model = createModel(context, () => Tab2Model());
    tab3Model = createModel(context, () => Tab3Model());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    tab1Model.dispose();
    tab2Model.dispose();
    tab3Model.dispose();
  }
}
