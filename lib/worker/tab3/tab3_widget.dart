import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/worker/confirm/confirm_widget.dart';
import '/worker/mini_confirm/mini_confirm_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'tab3_model.dart';
export 'tab3_model.dart';

class Tab3Widget extends StatefulWidget {
  const Tab3Widget({super.key});

  @override
  State<Tab3Widget> createState() => _Tab3WidgetState();
}

class _Tab3WidgetState extends State<Tab3Widget> {
  late Tab3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Tab3Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<OrdersRow>>(
      future: OrdersTable().queryRows(
        queryFn: (q) => q
            .or("status.eq.${Status.completed.name}, status.eq.${Status.givenAway.name}")
            .order('status', ascending: true)
            .order('created_at'),
      ),
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
        List<OrdersRow> listViewOrdersRowList = snapshot.data!;

        return ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: listViewOrdersRowList.length,
          separatorBuilder: (_, __) => SizedBox(height: 5.0),
          itemBuilder: (context, listViewIndex) {
            final listViewOrdersRow = listViewOrdersRowList[listViewIndex];
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onDoubleTap: () async {
                    await launchUrl(Uri(
                      scheme: 'tel',
                      path: '+${listViewOrdersRow.phone}',
                    ));
                  },
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      extentRatio: 0.75,
                      children: [
                        SlidableAction(
                          label: ' Отдать',
                          backgroundColor: Color(0xFF102C54),
                          icon: Icons.output_sharp,
                          onPressed: (_) async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              isDismissible: false,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height: double.infinity,
                                    child: ConfirmWidget(
                                      orderId: listViewOrdersRow.id,
                                      status: Status.givenAway,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                        SlidableAction(
                          label: 'Отменить',
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          icon: Icons.cancel,
                          onPressed: (_) async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              isDismissible: false,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height: double.infinity,
                                    child: ConfirmWidget(
                                      orderId: listViewOrdersRow.id,
                                      status: Status.canceled,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                        SlidableAction(
                          label: 'Удалить',
                          backgroundColor: FlutterFlowTheme.of(context).error,
                          icon: Icons.delete_outline_rounded,
                          onPressed: (_) async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              isDismissible: false,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height: double.infinity,
                                    child: ConfirmWidget(
                                      orderId: listViewOrdersRow.id,
                                      status: Status.delete,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        title: Text(
                          'Заказ ${listViewOrdersRow.number.toString()}',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        subtitle: Text(
                          'от ${listViewOrdersRow.name} ${listViewOrdersRow.surname} (${listViewOrdersRow.totalPrice.toString()} р.)',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        tileColor: valueOrDefault<Color>(
                          () {
                            if (listViewOrdersRow.status ==
                                Status.pending.name) {
                              return FlutterFlowTheme.of(context).tertiary;
                            } else if (listViewOrdersRow.status ==
                                Status.inProgress.name) {
                              return FlutterFlowTheme.of(context).primary;
                            } else if (listViewOrdersRow.status ==
                                Status.completed.name) {
                              return FlutterFlowTheme.of(context).secondary;
                            } else {
                              return Color(0x00000000);
                            }
                          }(),
                          FlutterFlowTheme.of(context).tertiary,
                        ),
                        dense: false,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                      ),
                    ),
                  ),
                ),
                FutureBuilder<List<MiniOrdersRow>>(
                  future: MiniOrdersTable().queryRows(
                    queryFn: (q) => q
                        .eqOrNull(
                          'orderId',
                          listViewOrdersRow.id,
                        )
                        .order('itemId'),
                  ),
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
                    List<MiniOrdersRow> columnMiniOrdersRowList =
                        snapshot.data!;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(columnMiniOrdersRowList.length,
                              (columnIndex) {
                        final columnMiniOrdersRow =
                            columnMiniOrdersRowList[columnIndex];
                        return FutureBuilder<List<ItemsRow>>(
                          future: ItemsTable().querySingleRow(
                            queryFn: (q) => q.eqOrNull(
                              'id',
                              columnMiniOrdersRow.itemId,
                            ),
                          ),
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
                            List<ItemsRow> stackItemsRowList = snapshot.data!;

                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final stackItemsRow = stackItemsRowList.isNotEmpty
                                ? stackItemsRowList.first
                                : null;

                            return Container(
                              height: 64.0,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Slidable(
                                      endActionPane: ActionPane(
                                        motion: const ScrollMotion(),
                                        extentRatio: 0.25,
                                        children: [
                                          SlidableAction(
                                            label: () {
                                              if (columnMiniOrdersRow.status ==
                                                  Status.pending.name) {
                                                return 'Взяться';
                                              } else if (columnMiniOrdersRow
                                                      .status ==
                                                  Status.inProgress.name) {
                                                return 'Готов';
                                              } else {
                                                return 'Отменить';
                                              }
                                            }(),
                                            backgroundColor:
                                                valueOrDefault<Color>(
                                              () {
                                                if (columnMiniOrdersRow
                                                        .status ==
                                                    Status.pending.name) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primary;
                                                } else if (columnMiniOrdersRow
                                                        .status ==
                                                    Status.inProgress.name) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondary;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary;
                                                }
                                              }(),
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                            icon: FontAwesomeIcons.exchangeAlt,
                                            onPressed: (_) async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                isDismissible: false,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: double.infinity,
                                                      child: MiniConfirmWidget(
                                                        status: () {
                                                          if (columnMiniOrdersRow
                                                                  .status ==
                                                              Status.pending
                                                                  .name) {
                                                            return 'Взяться';
                                                          } else if (columnMiniOrdersRow
                                                                  .status ==
                                                              Status.inProgress
                                                                  .name) {
                                                            return 'Готов';
                                                          } else {
                                                            return 'Отменить';
                                                          }
                                                        }(),
                                                        nextStatus: () {
                                                          if (columnMiniOrdersRow
                                                                  .status ==
                                                              Status.pending
                                                                  .name) {
                                                            return Status
                                                                .inProgress
                                                                .name;
                                                          } else if (columnMiniOrdersRow
                                                                  .status ==
                                                              Status.inProgress
                                                                  .name) {
                                                            return Status
                                                                .completed.name;
                                                          } else {
                                                            return Status
                                                                .pending.name;
                                                          }
                                                        }(),
                                                        workerId:
                                                            FFAppState().userId,
                                                        miniOrderId:
                                                            columnMiniOrdersRow
                                                                .id,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                          ),
                                        ],
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: ListTile(
                                          title: Text(
                                            'x${columnMiniOrdersRow.quantity.toString()} ${stackItemsRow?.name}',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          subtitle: Text(
                                            'от ${listViewOrdersRow.name} ${listViewOrdersRow.surname}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          tileColor: valueOrDefault<Color>(
                                            () {
                                              if (columnMiniOrdersRow.status ==
                                                  Status.pending.name) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .tertiary;
                                              } else if (columnMiniOrdersRow
                                                      .status ==
                                                  Status.inProgress.name) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primary;
                                              } else if (columnMiniOrdersRow
                                                      .status ==
                                                  Status.completed.name) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .secondary;
                                              } else {
                                                return Color(0x00000000);
                                              }
                                            }(),
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                          dense: false,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  76.0, 0.0, 12.0, 0.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 64.0,
                                    height: 64.0,
                                    constraints: BoxConstraints(
                                      maxWidth: 64.0,
                                      maxHeight: 64.0,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Image.network(
                                      stackItemsRow!.imageUrl,
                                      width: 64.0,
                                      height: 64.0,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        'assets/images/error_image.jpg',
                                        width: 64.0,
                                        height: 64.0,
                                        fit: BoxFit.cover,
                                      ),
                                      cacheWidth: 64,
                                      cacheHeight: 64,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      })
                          .divide(SizedBox(height: 3.0))
                          .around(SizedBox(height: 3.0)),
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
