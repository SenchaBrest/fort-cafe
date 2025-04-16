import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'nothing_model.dart';
export 'nothing_model.dart';

class NothingWidget extends StatefulWidget {
  const NothingWidget({super.key});

  @override
  State<NothingWidget> createState() => _NothingWidgetState();
}

class _NothingWidgetState extends State<NothingWidget> {
  late NothingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NothingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Icon(
          Icons.sentiment_dissatisfied,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 64.0,
        ),
      ),
    );
  }
}
