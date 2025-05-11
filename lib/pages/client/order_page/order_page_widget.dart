import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/client/sign_up/sign_up_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_page_model.dart';
export 'order_page_model.dart';

class OrderPageWidget extends StatefulWidget {
  const OrderPageWidget({
    super.key,
    required this.cart,
  });

  final List<dynamic>? cart;

  static String routeName = 'OrderPage';
  static String routePath = '/orderPage';

  @override
  State<OrderPageWidget> createState() => _OrderPageWidgetState();
}

class _OrderPageWidgetState extends State<OrderPageWidget> {
  late OrderPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.setupTelegramBackButtonPop(
        context,
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
            child: Stack(
              children: [
                StreamBuilder<List<ItemsRow>>(
                  stream: _model.containerSupabaseStream ??= SupaFlow.client
                      .from("items")
                      .stream(primaryKey: ['id'])
                      .inFilterOrNull(
                        'id',
                        widget.cart
                            ?.map((e) => getJsonField(
                                  e,
                                  r'''$.id''',
                                ))
                            .toList()
                            .map((e) => e.toString())
                            .toList(),
                      )
                      .map((list) =>
                          list.map((item) => ItemsRow(item)).toList()),
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
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 81.0),
                        child: Builder(
                          builder: (context) {
                            final item = widget.cart!.toList();

                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:
                                    List.generate(item.length, (itemIndex) {
                                  final itemItem = item[itemIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                getJsonField(
                                                  itemItem,
                                                  r'''$.imageUrl''',
                                                ).toString(),
                                                width: 60.0,
                                                height: 60.0,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.png',
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: AutoSizeText(
                                                getJsonField(
                                                  itemItem,
                                                  r'''$.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          font:
                                                              GoogleFonts.forum(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${getJsonField(
                                                  itemItem,
                                                  r'''$.count''',
                                                ).toString()}x',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          font:
                                                              GoogleFonts.forum(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Text(
                                                  '${((getJsonField(
                                                        itemItem,
                                                        r'''$.price''',
                                                      ) * getJsonField(
                                                        itemItem,
                                                        r'''$.count''',
                                                      ) * 10).round() / 10).toString()} р.',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        font: GoogleFonts.forum(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(width: 5.0))
                                              .around(SizedBox(width: 5.0)),
                                        ),
                                      ),
                                      if ((containerItemsRowList
                                                  .where((e) =>
                                                      e.id ==
                                                      getJsonField(
                                                        itemItem,
                                                        r'''$.id''',
                                                      ).toString())
                                                  .toList()
                                                  .firstOrNull!
                                                  .count <
                                              getJsonField(
                                                itemItem,
                                                r'''$.count''',
                                              )) ||
                                          (containerItemsRowList
                                                  .where((e) =>
                                                      e.id ==
                                                      getJsonField(
                                                        itemItem,
                                                        r'''$.id''',
                                                      ).toString())
                                                  .toList()
                                                  .firstOrNull
                                                  ?.count ==
                                              0))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 15.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                AutoSizeText(
                                                  'В наличии всего ${containerItemsRowList.where((e) => e.id == getJsonField(
                                                        itemItem,
                                                        r'''$.id''',
                                                      ).toString()).toList().firstOrNull?.count.toString()}, а вы заказываете ${getJsonField(
                                                    itemItem,
                                                    r'''$.count''',
                                                  ).toString()}. Измените в меню количество, чтобы продолжить. ',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.forum(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Container(
                                                  width: 0.0,
                                                  height: 0.0,
                                                  decoration: BoxDecoration(),
                                                  child: wrapWithModel(
                                                    model: _model.emptyModels
                                                        .getModel(
                                                      getJsonField(
                                                        itemItem,
                                                        r'''$.id''',
                                                      ).toString(),
                                                      itemIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: EmptyWidget(
                                                      key: Key(
                                                        'Keywtc_${getJsonField(
                                                          itemItem,
                                                          r'''$.id''',
                                                        ).toString()}',
                                                      ),
                                                      callback: () async {
                                                        _model.showOrderButton =
                                                            false;
                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                })
                                        .divide(SizedBox(height: 5.0))
                                        .around(SizedBox(height: 5.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
                if (_model.showOrderButton)
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      height: 81.0,
                      constraints: BoxConstraints(
                        maxHeight: 81.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Рекомендованное пожертвование: ${functions.getTotaPrice(widget.cart!.map((e) => e.toString()).toList()).toString()} р.',
                            maxLines: 1,
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      font: GoogleFonts.forum(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 7.0, 15.0, 7.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  _model.userInfo =
                                      await UsersTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'userId',
                                      FFAppState().userId,
                                    ),
                                  );
                                  if (_model.userInfo?.firstOrNull?.role !=
                                      Role.ban_user.name) {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: double.infinity,
                                              child: SignUpWidget(
                                                name: _model
                                                                .userInfo
                                                                ?.firstOrNull
                                                                ?.name !=
                                                            null &&
                                                        _model
                                                                .userInfo
                                                                ?.firstOrNull
                                                                ?.name !=
                                                            ''
                                                    ? _model.userInfo!
                                                        .firstOrNull!.name!
                                                    : '',
                                                surname: _model
                                                                .userInfo
                                                                ?.firstOrNull
                                                                ?.surname !=
                                                            null &&
                                                        _model
                                                                .userInfo
                                                                ?.firstOrNull
                                                                ?.surname !=
                                                            ''
                                                    ? _model.userInfo!
                                                        .firstOrNull!.surname!
                                                    : '',
                                                phone: _model
                                                                .userInfo
                                                                ?.firstOrNull
                                                                ?.phone !=
                                                            null &&
                                                        _model
                                                                .userInfo
                                                                ?.firstOrNull
                                                                ?.phone !=
                                                            ''
                                                    ? _model.userInfo!
                                                        .firstOrNull!.phone!
                                                    : '',
                                                cart: widget.cart!,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    await actions
                                        .hapticFeedbackForTelegramByType(
                                      'impact_light',
                                    );
                                  }

                                  safeSetState(() {});
                                },
                                text: 'ЗАКАЗАТЬ',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        font: GoogleFonts.forum(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                showLoadingIndicator: false,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
