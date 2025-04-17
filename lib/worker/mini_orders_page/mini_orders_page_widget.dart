import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/nothing_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/worker/mini_confirm/mini_confirm_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'mini_orders_page_model.dart';
export 'mini_orders_page_model.dart';

class MiniOrdersPageWidget extends StatefulWidget {
  const MiniOrdersPageWidget({
    super.key,
    required this.category,
  });

  final String? category;

  static String routeName = 'MiniOrdersPage';
  static String routePath = '/miniOrdersPage';

  @override
  State<MiniOrdersPageWidget> createState() => _MiniOrdersPageWidgetState();
}

class _MiniOrdersPageWidgetState extends State<MiniOrdersPageWidget> {
  late MiniOrdersPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiniOrdersPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.setupTelegramBackButtonPop(
        context,
      );
      await actions.unsubscribe(
        'miniOrders',
      );
      await actions.subscribe(
        'miniOrders',
        () async {
          safeSetState(() => _model.requestCompleter = null);
          await _model.waitForRequestCompleted();
        },
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      await actions.hideBackButton();
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                valueOrDefault<double>(
                  (double width) {
                    return width > 480.0 ? (width - 480.0) / 2 : 0.0;
                  }(MediaQuery.sizeOf(context).width),
                  0.0,
                ),
                0.0,
                valueOrDefault<double>(
                  (double width) {
                    return width > 480.0 ? (width - 480.0) / 2 : 0.0;
                  }(MediaQuery.sizeOf(context).width),
                  0.0,
                ),
                0.0),
            child: FutureBuilder<List<MiniOrdersRow>>(
              future:
                  (_model.requestCompleter ??= Completer<List<MiniOrdersRow>>()
                        ..complete(MiniOrdersTable().queryRows(
                          queryFn: (q) => q
                              .eqOrNull(
                                'category',
                                widget.category,
                              )
                              .eqOrNull(
                                'status',
                                Status.pending.name,
                              )
                              .order('created_at', ascending: true),
                        )))
                      .future,
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
                List<MiniOrdersRow> listViewMiniOrdersRowList = snapshot.data!;

                if (listViewMiniOrdersRowList.isEmpty) {
                  return NothingWidget();
                }

                return ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 3.0),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewMiniOrdersRowList.length,
                  separatorBuilder: (_, __) => SizedBox(height: 3.0),
                  itemBuilder: (context, listViewIndex) {
                    final listViewMiniOrdersRow =
                        listViewMiniOrdersRowList[listViewIndex];
                    return FutureBuilder<List<ItemsRow>>(
                      future: ItemsTable().querySingleRow(
                        queryFn: (q) => q.eqOrNull(
                          'id',
                          listViewMiniOrdersRow.itemId,
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 64.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: FutureBuilder<List<OrdersRow>>(
                                      future: OrdersTable().querySingleRow(
                                        queryFn: (q) => q.eqOrNull(
                                          'id',
                                          listViewMiniOrdersRow.orderId,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 15.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<OrdersRow> listTileOrdersRowList =
                                            snapshot.data!;

                                        final listTileOrdersRow =
                                            listTileOrdersRowList.isNotEmpty
                                                ? listTileOrdersRowList.first
                                                : null;

                                        return Slidable(
                                          endActionPane: ActionPane(
                                            motion: const ScrollMotion(),
                                            extentRatio: 0.25,
                                            children: [
                                              SlidableAction(
                                                label: 'Взяться',
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: FontAwesomeIcons
                                                    .exchangeAlt,
                                                onPressed: (_) async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    isDismissible: false,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height:
                                                                double.infinity,
                                                            child:
                                                                MiniConfirmWidget(
                                                              status: 'Взяться',
                                                              nextStatus: Status
                                                                  .inProgress
                                                                  .name,
                                                              workerId:
                                                                  FFAppState()
                                                                      .userId,
                                                              miniOrderId:
                                                                  listViewMiniOrdersRow
                                                                      .id,
                                                            ),
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
                                                'x${listViewMiniOrdersRow.quantity.toString()} ${stackItemsRow?.name}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                'от ${listTileOrdersRow?.name} ${listTileOrdersRow?.surname}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              dense: false,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          76.0, 0.0, 12.0, 0.0),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
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
                                  errorBuilder: (context, error, stackTrace) =>
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
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
