import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/nothing_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/client/item/item_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
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

    return StreamBuilder<List<ItemsRow>>(
      stream: _model.homePageSupabaseStream ??= SupaFlow.client
          .from("items")
          .stream(primaryKey: ['id'])
          .eqOrNull(
            'isActive',
            true,
          )
          .map((list) => list.map((item) => ItemsRow(item)).toList()),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 15.0,
                height: 15.0,
                child: SpinKitThreeBounce(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 15.0,
                ),
              ),
            ),
          );
        }
        List<ItemsRow> homePageItemsRowList = snapshot.data!;

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
                child: StreamBuilder<List<FlagsRow>>(
                  stream: _model.stackSupabaseStream ??= SupaFlow.client
                      .from("flags")
                      .stream(primaryKey: ['name'])
                      .eqOrNull(
                        'name',
                        'working',
                      )
                      .map((list) =>
                          list.map((item) => FlagsRow(item)).toList()),
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

                    final stackFlagsRow = stackFlagsRowList.isNotEmpty
                        ? stackFlagsRowList.first
                        : null;

                    return Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  final categories = homePageItemsRowList
                                      .map((e) => e.category)
                                      .toList()
                                      .unique((e) => e)
                                      .sortedList(keyOf: (e) => e, desc: false)
                                      .toList();
                                  if (categories.isEmpty) {
                                    return NothingWidget();
                                  }

                                  return SingleChildScrollView(
                                    primary: false,
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
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 15.0),
                                                child: Text(
                                                  categoriesItem,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        font: GoogleFonts.forum(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
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
                                                                          ? (width - 360.0) /
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
                                                                          ? (width - 360.0) /
                                                                              6
                                                                          : 0.0
                                                              : 0.0;
                                                        }(MediaQuery.sizeOf(
                                                                context)
                                                            .width),
                                                        0.0,
                                                      ),
                                                      30.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final items =
                                                      homePageItemsRowList
                                                          .where((e) =>
                                                              e.category ==
                                                              categoriesItem)
                                                          .toList();
                                                  if (items.isEmpty) {
                                                    return NothingWidget();
                                                  }

                                                  return Wrap(
                                                    spacing: (double width) {
                                                      return width < 480.0
                                                          ? (width >= 133.0 &&
                                                                  width < 240.0)
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
                                                    }(MediaQuery.sizeOf(context)
                                                        .width),
                                                    runSpacing: 0.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: List.generate(
                                                        items.length,
                                                        (itemsIndex) {
                                                      final itemsItem =
                                                          items[itemsIndex];
                                                      return Container(
                                                        width: 120.0,
                                                        height: 179.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .itemModels
                                                              .getModel(
                                                            itemsItem.id,
                                                            itemsIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          updateOnChange: true,
                                                          child: ItemWidget(
                                                            key: Key(
                                                              'Keyqog_${itemsItem.id}',
                                                            ),
                                                            imageUrl: itemsItem
                                                                .imageUrl,
                                                            name:
                                                                itemsItem.name,
                                                            price:
                                                                itemsItem.price,
                                                            count:
                                                                itemsItem.count,
                                                            add: () async {
                                                              await actions
                                                                  .hapticFeedbackForTelegramByType(
                                                                'impact_light',
                                                              );
                                                              _model.cart = functions
                                                                  .addItemToCart(
                                                                      _model
                                                                          .cart
                                                                          .toList(),
                                                                      itemsItem
                                                                          .id,
                                                                      itemsItem
                                                                          .name,
                                                                      itemsItem
                                                                          .price,
                                                                      itemsItem
                                                                          .category,
                                                                      itemsItem
                                                                          .imageUrl)!
                                                                  .toList()
                                                                  .cast<
                                                                      dynamic>();
                                                            },
                                                            remove: () async {
                                                              await actions
                                                                  .hapticFeedbackForTelegramByType(
                                                                'impact_light',
                                                              );
                                                              _model.cart = functions
                                                                  .removeItemFromCart(
                                                                      _model
                                                                          .cart
                                                                          .toList(),
                                                                      itemsItem
                                                                          .id)!
                                                                  .toList()
                                                                  .cast<
                                                                      dynamic>();
                                                            },
                                                            delete: () async {
                                                              _model.cart = functions
                                                                  .deleteItem(
                                                                      _model
                                                                          .cart
                                                                          .toList(),
                                                                      itemsItem
                                                                          .id)!
                                                                  .toList()
                                                                  .cast<
                                                                      dynamic>();
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          ],
                                        );
                                      }),
                                    ),
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
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 7.0, 15.0, 7.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
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

                                    await actions
                                        .hapticFeedbackForTelegramByType(
                                      'notification_success',
                                    );
                                  },
                                  text: 'ПРОСМОТРЕТЬ ЗАКАЗ',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                          ),
                        if (!stackFlagsRow!.isField)
                          Opacity(
                            opacity: 0.9,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'КАФЕ\nВРЕМЕННО\nНЕ РАБОТАЕТ',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        font: GoogleFonts.forum(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .fontStyle,
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
          ),
        );
      },
    );
  }
}
