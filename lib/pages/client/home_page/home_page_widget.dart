import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/nothing_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/client/item/item_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.role = await UsersTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'userId',
          FFAppState().userId,
        ),
      );
      FFAppState().role = valueOrDefault<String>(
        _model.role?.firstOrNull?.role,
        'user',
      );
      safeSetState(() {});
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          safeSetState(() {});
        },
        startImmediately: true,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
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
          child: FutureBuilder<List<FlagsRow>>(
            future: FlagsTable().querySingleRow(
              queryFn: (q) => q.eqOrNull(
                'name',
                'working',
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
              List<FlagsRow> stackFlagsRowList = snapshot.data!;

              final stackFlagsRow =
                  stackFlagsRowList.isNotEmpty ? stackFlagsRowList.first : null;

              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FutureBuilder<ApiCallResponse>(
                          future: GetCategoriesCall.call(),
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
                            final columnGetCategoriesResponse = snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final categories = functions
                                    .getUniqueCategories((getJsonField(
                                                  columnGetCategoriesResponse
                                                      .jsonBody,
                                                  r'''$[:]''',
                                                ) !=
                                                null
                                            ? (getJsonField(
                                                columnGetCategoriesResponse
                                                    .jsonBody,
                                                r'''$[?(@.isActive == true)].category''',
                                                true,
                                              ) as List)
                                                .map<String>(
                                                    (s) => s.toString())
                                                .toList()
                                            : List.generate(
                                                random_data.randomInteger(0, 0),
                                                (index) =>
                                                    random_data.randomString(
                                                      1,
                                                      10,
                                                      true,
                                                      false,
                                                      false,
                                                    )))
                                        .toList())
                                    .toList();
                                if (categories.isEmpty) {
                                  return NothingWidget();
                                }

                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: List.generate(categories.length,
                                        (categoriesIndex) {
                                      final categoriesItem =
                                          categories[categoriesIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                              child: Text(
                                                categoriesItem,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    valueOrDefault<double>(
                                                      (double width) {
                                                        return width < 480.0
                                                            ? (width >= 133.0 &&
                                                                    width <
                                                                        240.0)
                                                                ? (width -
                                                                        120.0) /
                                                                    2
                                                                : (width >= 240.0 &&
                                                                        width <
                                                                            360.0)
                                                                    ? (width -
                                                                            240.0) /
                                                                        4
                                                                    : (width >=
                                                                            360.0)
                                                                        ? (width -
                                                                                360.0) /
                                                                            6
                                                                        : 0.0
                                                            : 0.0;
                                                      }(MediaQuery.sizeOf(
                                                              context)
                                                          .width),
                                                      0.0,
                                                    ),
                                                    0.0,
                                                    valueOrDefault<double>(
                                                      (double width) {
                                                        return width < 480.0
                                                            ? (width >= 133.0 &&
                                                                    width <
                                                                        240.0)
                                                                ? (width -
                                                                        120.0) /
                                                                    2
                                                                : (width >= 240.0 &&
                                                                        width <
                                                                            360.0)
                                                                    ? (width -
                                                                            240.0) /
                                                                        4
                                                                    : (width >=
                                                                            360.0)
                                                                        ? (width -
                                                                                360.0) /
                                                                            6
                                                                        : 0.0
                                                            : 0.0;
                                                      }(MediaQuery.sizeOf(
                                                              context)
                                                          .width),
                                                      0.0,
                                                    ),
                                                    0.0),
                                            child:
                                                FutureBuilder<List<ItemsRow>>(
                                              future: ItemsTable().queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'category',
                                                      categoriesItem,
                                                    )
                                                    .eqOrNull(
                                                      'isActive',
                                                      true,
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 15.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ItemsRow>
                                                    wrapItemsRowList =
                                                    snapshot.data!;

                                                if (wrapItemsRowList.isEmpty) {
                                                  return NothingWidget();
                                                }

                                                return Wrap(
                                                  spacing: (double width) {
                                                    return width < 480.0
                                                        ? (width >= 133.0 &&
                                                                width < 240.0)
                                                            ? (width - 120.0) /
                                                                2
                                                            : (width >= 240.0 &&
                                                                    width <
                                                                        360.0)
                                                                ? (width -
                                                                        240.0) /
                                                                    4
                                                                : (width >=
                                                                        360.0)
                                                                    ? (width -
                                                                            360.0) /
                                                                        6
                                                                    : 0.0
                                                        : 0.0;
                                                  }(MediaQuery.sizeOf(context)
                                                      .width),
                                                  runSpacing: 0.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: List.generate(
                                                      wrapItemsRowList.length,
                                                      (wrapIndex) {
                                                    final wrapItemsRow =
                                                        wrapItemsRowList[
                                                            wrapIndex];
                                                    return Container(
                                                      width: 120.0,
                                                      height: 175.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model.itemModels
                                                            .getModel(
                                                          wrapItemsRow.id,
                                                          wrapIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        updateOnChange: true,
                                                        child: ItemWidget(
                                                          key: Key(
                                                            'Keyqog_${wrapItemsRow.id}',
                                                          ),
                                                          imageUrl: wrapItemsRow
                                                              .imageUrl,
                                                          name:
                                                              wrapItemsRow.name,
                                                          price: wrapItemsRow
                                                              .price,
                                                          add: () async {
                                                            await actions
                                                                .hapticFeedbackForTelegramByType(
                                                              'impact_light',
                                                            );
                                                            _model.cart = functions
                                                                .addItemToCart(
                                                                    _model.cart
                                                                        .toList(),
                                                                    wrapItemsRow
                                                                        .id,
                                                                    wrapItemsRow
                                                                        .name,
                                                                    wrapItemsRow
                                                                        .price,
                                                                    wrapItemsRow
                                                                        .category,
                                                                    wrapItemsRow
                                                                        .imageUrl)!
                                                                .toList()
                                                                .cast<
                                                                    dynamic>();
                                                            safeSetState(() {});
                                                          },
                                                          remove: () async {
                                                            await actions
                                                                .hapticFeedbackForTelegramByType(
                                                              'impact_light',
                                                            );
                                                            _model.cart = functions
                                                                .removeItemFromCar(
                                                                    _model.cart
                                                                        .toList(),
                                                                    wrapItemsRow
                                                                        .id)!
                                                                .toList()
                                                                .cast<
                                                                    dynamic>();
                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                          Divider(
                                            thickness: 2.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ],
                                      );
                                    }),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(),
                        ),
                      ],
                    ),
                  ),
                  if ((_model.cart.isNotEmpty) == true)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        height: 60.0,
                        constraints: BoxConstraints(
                          maxHeight: 60.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 7.0, 15.0, 7.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.nonActiveItems2 =
                                  await GetNonActiveItemsCall.call();

                              _model.cart = functions
                                  .removeItemFromCartCopy(
                                      _model.cart.toList(),
                                      (getJsonField(
                                                    (_model.nonActiveItems2
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$[?(@.isActive == false)].id''',
                                                  ) !=
                                                  null
                                              ? (getJsonField(
                                                  (_model.nonActiveItems2
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$[?(@.isActive == false)].id''',
                                                  true,
                                                ) as List)
                                                  .map<String>(
                                                      (s) => s.toString())
                                                  .toList()
                                              : List.generate(
                                                  random_data.randomInteger(
                                                      0, 0),
                                                  (index) =>
                                                      random_data.randomString(
                                                        0,
                                                        0,
                                                        true,
                                                        false,
                                                        false,
                                                      )))
                                          .toList())!
                                  .toList()
                                  .cast<dynamic>();
                              safeSetState(() {});
                              if (_model.cart.isNotEmpty) {
                                context.pushNamed(
                                  OrderPageWidget.routeName,
                                  queryParameters: {
                                    'cart': serializeParam(
                                      _model.cart,
                                      ParamType.JSON,
                                      isList: true,
                                    ),
                                  }.withoutNulls,
                                );

                                await actions.hapticFeedbackForTelegramByType(
                                  'notification_success',
                                );
                              }

                              safeSetState(() {});
                            },
                            text: 'ПРОСМОТРЕТЬ ЗАКАЗ',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                      ),
                    ),
                  if (!stackFlagsRow!.isField)
                    Opacity(
                      opacity: 0.9,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'КАФЕ\nВРЕМЕННО\nНЕ РАБОТАЕТ',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ),
                      ),
                    ),
                  if (FFAppState().role == 'ban_user')
                    Opacity(
                      opacity: 0.9,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'ВЫ\nЗАБЛОКИРОВАНЫ',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ),
                      ),
                    ),
                  if ((FFAppState().role == 'worker') ||
                      (FFAppState().role == 'admin'))
                    Align(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            100.0, 0.0, 0.0, 100.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              WorkerPageWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.rightToLeft,
                                ),
                              },
                            );
                          },
                          onDoubleTap: () async {
                            if (FFAppState().role == Role.admin.name) {
                              context.pushNamed(
                                AdminPageWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            } else {
                              context.pushNamed(
                                WorkerPageWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            }
                          },
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
