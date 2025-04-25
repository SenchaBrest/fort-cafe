import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'tab1_model.dart';
export 'tab1_model.dart';

class Tab1Widget extends StatefulWidget {
  const Tab1Widget({super.key});

  @override
  State<Tab1Widget> createState() => _Tab1WidgetState();
}

class _Tab1WidgetState extends State<Tab1Widget> {
  late Tab1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Tab1Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MiniOrdersRow>>(
      stream: _model.containerSupabaseStream1 ??= SupaFlow.client
          .from("miniOrders")
          .stream(primaryKey: ['id'])
          .eqOrNull(
            'status',
            Status.pending.name,
          )
          .map((list) => list.map((item) => MiniOrdersRow(item)).toList()),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 15.0,
              height: 15.0,
              child: SpinKitThreeBounce(
                color: FlutterFlowTheme.of(context).primary,
                size: 15.0,
              ),
            ),
          );
        }
        List<MiniOrdersRow> containerMiniOrdersRowList = snapshot.data!;

        return Container(
          decoration: BoxDecoration(),
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: StreamBuilder<List<ItemsRow>>(
              stream: _model.containerSupabaseStream2 ??= SupaFlow.client
                  .from("items")
                  .stream(primaryKey: ['id']).map(
                      (list) => list.map((item) => ItemsRow(item)).toList()),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 15.0,
                      height: 15.0,
                      child: SpinKitThreeBounce(
                        color: FlutterFlowTheme.of(context).primary,
                        size: 15.0,
                      ),
                    ),
                  );
                }
                List<ItemsRow> containerItemsRowList = snapshot.data!;

                return Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final categories = containerItemsRowList
                            .map((e) => e.category)
                            .toList()
                            .unique((e) => e)
                            .toList();

                        return Wrap(
                          spacing: 7.0,
                          runSpacing: 7.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.center,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: List.generate(categories.length,
                              (categoriesIndex) {
                            final categoriesItem = categories[categoriesIndex];
                            return FFButtonWidget(
                              onPressed: (valueOrDefault<String>(
                                        ((List<String>? categories,
                                                    String category) {
                                          return (categories ?? [])
                                              .where((element) =>
                                                  element == category)
                                              .length;
                                        }(
                                                containerMiniOrdersRowList
                                                    .map((e) => e.category)
                                                    .withoutNulls
                                                    .toList(),
                                                categoriesItem))
                                            .toString(),
                                        '0',
                                      ) ==
                                      '0')
                                  ? null
                                  : () async {
                                      context.pushNamed(
                                        MiniOrdersPageWidget.routeName,
                                        queryParameters: {
                                          'category': serializeParam(
                                            categoriesItem,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: '${valueOrDefault<String>(
                                ((List<String>? categories, String category) {
                                  return (categories ?? [])
                                      .where((element) => element == category)
                                      .length;
                                }(
                                        containerMiniOrdersRowList
                                            .map((e) => e.category)
                                            .withoutNulls
                                            .toList(),
                                        categoriesItem))
                                    .toString(),
                                '0',
                              )} ${categoriesItem}',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: valueOrDefault<Color>(
                                  valueOrDefault<String>(
                                            ((List<String>? categories,
                                                        String category) {
                                              return (categories ?? [])
                                                  .where((element) =>
                                                      element == category)
                                                  .length;
                                            }(
                                                    containerMiniOrdersRowList
                                                        .map((e) => e.category)
                                                        .withoutNulls
                                                        .toList(),
                                                    categoriesItem))
                                                .toString(),
                                            '0',
                                          ) ==
                                          '0'
                                      ? FlutterFlowTheme.of(context).alternate
                                      : FlutterFlowTheme.of(context).accent1,
                                  FlutterFlowTheme.of(context).alternate,
                                ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .override(
                                      fontFamily: 'amoret',
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: valueOrDefault<Color>(
                                    valueOrDefault<String>(
                                              ((List<String>? categories,
                                                          String category) {
                                                return (categories ?? [])
                                                    .where((element) =>
                                                        element == category)
                                                    .length;
                                              }(
                                                      containerMiniOrdersRowList
                                                          .map(
                                                              (e) => e.category)
                                                          .withoutNulls
                                                          .toList(),
                                                      categoriesItem))
                                                  .toString(),
                                              '0',
                                            ) ==
                                            '0'
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryText
                                        : FlutterFlowTheme.of(context).primary,
                                    FlutterFlowTheme.of(context).secondaryText,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledTextColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
