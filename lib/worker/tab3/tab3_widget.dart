import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return StreamBuilder<List<ItemsRow>>(
      stream: FFAppState().items(
        requestFn: () => _model.containerSupabaseStream1 ??= SupaFlow.client
            .from("items")
            .stream(primaryKey: ['id']).map(
                (list) => list.map((item) => ItemsRow(item)).toList()),
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
        List<ItemsRow> containerItemsRowList = snapshot.data!;

        return Container(
          decoration: BoxDecoration(),
          child: StreamBuilder<List<MiniOrdersRow>>(
            stream: _model.containerSupabaseStream2 ??= SupaFlow.client
                .from("miniOrders")
                .stream(primaryKey: ['id']).map(
                    (list) => list.map((item) => MiniOrdersRow(item)).toList()),
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
                child: StreamBuilder<List<OrdersRow>>(
                  stream: _model.listViewSupabaseStream ??= SupaFlow.client
                      .from("orders")
                      .stream(primaryKey: ['id'])
                      .order('created_at', ascending: true)
                      .order('status', ascending: true)
                      .map((list) =>
                          list.map((item) => OrdersRow(item)).toList()),
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

                    return ListView.builder(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        3.0,
                        0,
                        0,
                      ),
                      primary: false,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewOrdersRowList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewOrdersRow =
                            listViewOrdersRowList[listViewIndex];
                        return Visibility(
                          visible: (listViewOrdersRow.status ==
                                  Status.completed.name) ||
                              (listViewOrdersRow.status ==
                                  Status.givenAway.name),
                          child: Column(
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
                                    extentRatio: 0.5,
                                    children: [
                                      SlidableAction(
                                        label: ' Отдать',
                                        backgroundColor: Color(0xFF102C54),
                                        icon: Icons.output_sharp,
                                        onPressed: (_) async {
                                          await OrdersTable().update(
                                            data: {
                                              'status': Status.givenAway.name,
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              listViewOrdersRow.id,
                                            ),
                                          );
                                          await actions
                                              .hapticFeedbackForTelegramByType(
                                            'notification_success',
                                          );
                                        },
                                      ),
                                      SlidableAction(
                                        label: 'Отменить',
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        icon: Icons.cancel,
                                        onPressed: (_) async {
                                          await OrdersTable().update(
                                            data: {
                                              'status': Status.canceled.name,
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              listViewOrdersRow.id,
                                            ),
                                          );
                                          await actions
                                              .hapticFeedbackForTelegramByType(
                                            'notification_success',
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: ListTile(
                                      title: Text(
                                        'Заказ ${listViewOrdersRow.number.toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.forum(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      subtitle: Text(
                                        'от ${listViewOrdersRow.name} ${listViewOrdersRow.surname} (${listViewOrdersRow.totalPrice.toString()} р.)',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.forum(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      tileColor: valueOrDefault<Color>(
                                        () {
                                          if (listViewOrdersRow.status ==
                                              Status.pending.name) {
                                            return FlutterFlowTheme.of(context)
                                                .tertiary;
                                          } else if (listViewOrdersRow.status ==
                                              Status.inProgress.name) {
                                            return FlutterFlowTheme.of(context)
                                                .primary;
                                          } else if (listViewOrdersRow.status ==
                                              Status.completed.name) {
                                            return FlutterFlowTheme.of(context)
                                                .secondary;
                                          } else {
                                            return Color(0x00000000);
                                          }
                                        }(),
                                        FlutterFlowTheme.of(context).tertiary,
                                      ),
                                      dense: false,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              12.0, 0.0, 12.0, 0.0),
                                    ),
                                  ),
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  final items = containerMiniOrdersRowList
                                      .where((e) =>
                                          e.orderId == listViewOrdersRow.id)
                                      .toList()
                                      .sortedList(
                                          keyOf: (e) => e.id, desc: false)
                                      .toList();

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(items.length,
                                            (itemsIndex) {
                                      final itemsItem = items[itemsIndex];
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
                                                        if (itemsItem.status ==
                                                            Status
                                                                .pending.name) {
                                                          return 'Взяться';
                                                        } else if (itemsItem
                                                                .status ==
                                                            Status.inProgress
                                                                .name) {
                                                          return 'Готов';
                                                        } else {
                                                          return 'Отменить';
                                                        }
                                                      }(),
                                                      backgroundColor:
                                                          valueOrDefault<Color>(
                                                        () {
                                                          if (itemsItem
                                                                  .status ==
                                                              Status.pending
                                                                  .name) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .primary;
                                                          } else if (itemsItem
                                                                  .status ==
                                                              Status.inProgress
                                                                  .name) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary;
                                                          } else {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary;
                                                          }
                                                        }(),
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                      icon: FontAwesomeIcons
                                                          .exchangeAlt,
                                                      onPressed: (_) async {
                                                        if (itemsItem.status ==
                                                            Status.completed
                                                                .name) {
                                                          await MiniOrdersTable()
                                                              .update(
                                                            data: {
                                                              'status': Status
                                                                  .pending.name,
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              itemsItem.id,
                                                            ),
                                                          );
                                                        } else if (itemsItem
                                                                .status ==
                                                            Status
                                                                .pending.name) {
                                                          await MiniOrdersTable()
                                                              .update(
                                                            data: {
                                                              'status': Status
                                                                  .inProgress
                                                                  .name,
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              itemsItem.id,
                                                            ),
                                                          );
                                                        } else if (itemsItem
                                                                .status ==
                                                            Status.inProgress
                                                                .name) {
                                                          await MiniOrdersTable()
                                                              .update(
                                                            data: {
                                                              'status': Status
                                                                  .completed
                                                                  .name,
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              itemsItem.id,
                                                            ),
                                                          );
                                                        }

                                                        await actions
                                                            .hapticFeedbackForTelegramByType(
                                                          'notification_success',
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  child: ListTile(
                                                    title: Text(
                                                      'x${itemsItem.quantity.toString()} ${containerItemsRowList.where((e) => e.id == itemsItem.itemId).toList().firstOrNull?.name}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .forum(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    subtitle: Text(
                                                      'от ${listViewOrdersRow.name} ${listViewOrdersRow.surname}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .forum(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    tileColor:
                                                        valueOrDefault<Color>(
                                                      () {
                                                        if (itemsItem.status ==
                                                            Status
                                                                .pending.name) {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary;
                                                        } else if (itemsItem
                                                                .status ==
                                                            Status.inProgress
                                                                .name) {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .primary;
                                                        } else if (itemsItem
                                                                .status ==
                                                            Status.completed
                                                                .name) {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary;
                                                        } else {
                                                          return Color(
                                                              0x00000000);
                                                        }
                                                      }(),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary,
                                                    ),
                                                    dense: false,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(76.0, 0.0,
                                                                12.0, 0.0),
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
                                                containerItemsRowList
                                                    .where((e) =>
                                                        e.id ==
                                                        itemsItem.itemId)
                                                    .toList()
                                                    .firstOrNull!
                                                    .imageUrl,
                                                width: 64.0,
                                                height: 64.0,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.png',
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
                                    })
                                        .divide(SizedBox(height: 3.0))
                                        .around(SizedBox(height: 3.0)),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
