import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/client/sign_up/sign_up_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 81.0),
                child: Builder(
                  builder: (context) {
                    final item = widget.cart!.toList();

                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(item.length, (itemIndex) {
                          final itemItem = item[itemIndex];
                          return Container(
                            width: double.infinity,
                            height: 60.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    getJsonField(
                                      itemItem,
                                      r'''$.imageUrl''',
                                    ).toString(),
                                    width: 60.0,
                                    height: 60.0,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/error_image.jpg',
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
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${getJsonField(
                                      itemItem,
                                      r'''$.count''',
                                    ).toString()}x',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Text(
                                      '${((getJsonField(
                                            itemItem,
                                            r'''$.price''',
                                          ) * getJsonField(
                                            itemItem,
                                            r'''$.count''',
                                          ) * 10).round() / 10).toString()} р.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(width: 5.0))
                                  .around(SizedBox(width: 5.0)),
                            ),
                          );
                        })
                            .divide(SizedBox(height: 5.0))
                            .around(SizedBox(height: 5.0)),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  height: 81.0,
                  constraints: BoxConstraints(
                    maxHeight: 81.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Рекомендованное пожертвование: ${functions.getTotaPrice(widget.cart!.map((e) => e.toString()).toList()).toString()} р.',
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 7.0, 15.0, 7.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.userInfo = await UsersTable().queryRows(
                                queryFn: (q) => q.eqOrNull(
                                  'userId',
                                  FFAppState().userId,
                                ),
                              );
                              if (_model.userInfo?.firstOrNull?.role !=
                                  Role.ban_user.name) {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: FlutterFlowTheme.of(context)
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
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: double.infinity,
                                          child: SignUpWidget(
                                            name: _model.userInfo?.firstOrNull
                                                            ?.name !=
                                                        null &&
                                                    _model.userInfo?.firstOrNull
                                                            ?.name !=
                                                        ''
                                                ? _model.userInfo!.firstOrNull!
                                                    .name!
                                                : '',
                                            surname: _model
                                                            .userInfo
                                                            ?.firstOrNull
                                                            ?.surname !=
                                                        null &&
                                                    _model.userInfo?.firstOrNull
                                                            ?.surname !=
                                                        ''
                                                ? _model.userInfo!.firstOrNull!
                                                    .surname!
                                                : '',
                                            phone: _model.userInfo?.firstOrNull
                                                            ?.phone !=
                                                        null &&
                                                    _model.userInfo?.firstOrNull
                                                            ?.phone !=
                                                        ''
                                                ? _model.userInfo!.firstOrNull!
                                                    .phone!
                                                : '',
                                            cart: widget.cart!,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                await actions.hapticFeedbackForTelegramByType(
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
