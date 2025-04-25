import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/admin/create_product/create_product_widget.dart';
import '/pages/admin/delete_item/delete_item_widget.dart';
import '/pages/admin/item_edit/item_edit_widget.dart';
import '/pages/admin/role_assignment/role_assignment_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'admin_page_model.dart';
export 'admin_page_model.dart';

class AdminPageWidget extends StatefulWidget {
  const AdminPageWidget({super.key});

  static String routeName = 'AdminPage';
  static String routePath = '/adminPage';

  @override
  State<AdminPageWidget> createState() => _AdminPageWidgetState();
}

class _AdminPageWidgetState extends State<AdminPageWidget>
    with TickerProviderStateMixin {
  late AdminPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ItemsRow>>(
      stream: _model.adminPageSupabaseStream ??= SupaFlow.client
          .from("items")
          .stream(primaryKey: ['id']).map(
              (list) => list.map((item) => ItemsRow(item)).toList()),
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
        List<ItemsRow> adminPageItemsRowList = snapshot.data!;

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
                    Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: FlutterFlowButtonTabBar(
                            useToggleButtonStyle: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'amoret',
                                  letterSpacing: 0.0,
                                ),
                            unselectedLabelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'amoret',
                                  letterSpacing: 0.0,
                                ),
                            labelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            backgroundColor:
                                FlutterFlowTheme.of(context).accent1,
                            unselectedBackgroundColor:
                                FlutterFlowTheme.of(context).alternate,
                            borderColor: FlutterFlowTheme.of(context).primary,
                            unselectedBorderColor:
                                FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            elevation: 0.0,
                            buttonMargin: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            padding: EdgeInsets.all(4.0),
                            tabs: [
                              Tab(
                                text: 'Меню',
                              ),
                              Tab(
                                text: 'Время',
                              ),
                              Tab(
                                text: 'Люди',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}, () async {}][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              KeepAliveWidgetWrapper(
                                builder: (context) => SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final categories =
                                              adminPageItemsRowList
                                                  .map((e) => e.category)
                                                  .toList()
                                                  .unique((e) => e)
                                                  .sortedList(
                                                      keyOf: (e) => e,
                                                      desc: false)
                                                  .toList();

                                          return SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: List.generate(
                                                  categories.length,
                                                  (categoriesIndex) {
                                                final categoriesItem =
                                                    categories[categoriesIndex];
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: Text(
                                                          categoriesItem,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'amoret',
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
                                                                    (double
                                                                        width) {
                                                                      return width <
                                                                              480.0
                                                                          ? (width >= 133.0 && width < 240.0)
                                                                              ? (width - 120.0) / 2
                                                                              : (width >= 240.0 && width < 360.0)
                                                                                  ? (width - 240.0) / 4
                                                                                  : (width >= 360.0)
                                                                                      ? (width - 360.0) / 6
                                                                                      : 0.0
                                                                          : 0.0;
                                                                    }(MediaQuery.sizeOf(
                                                                            context)
                                                                        .width),
                                                                    0.0,
                                                                  ),
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    (double
                                                                        width) {
                                                                      return width <
                                                                              480.0
                                                                          ? (width >= 133.0 && width < 240.0)
                                                                              ? (width - 120.0) / 2
                                                                              : (width >= 240.0 && width < 360.0)
                                                                                  ? (width - 240.0) / 4
                                                                                  : (width >= 360.0)
                                                                                      ? (width - 360.0) / 6
                                                                                      : 0.0
                                                                          : 0.0;
                                                                    }(MediaQuery.sizeOf(
                                                                            context)
                                                                        .width),
                                                                    0.0,
                                                                  ),
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final items =
                                                              adminPageItemsRowList
                                                                  .where((e) =>
                                                                      e.category ==
                                                                      categoriesItem)
                                                                  .toList();

                                                          return Wrap(
                                                            spacing:
                                                                (double width) {
                                                              return width <
                                                                      480.0
                                                                  ? (width >= 133.0 &&
                                                                          width <
                                                                              240.0)
                                                                      ? (width -
                                                                              120.0) /
                                                                          2
                                                                      : (width >= 240.0 &&
                                                                              width <
                                                                                  360.0)
                                                                          ? (width - 240.0) /
                                                                              4
                                                                          : (width >= 360.0)
                                                                              ? (width - 360.0) / 6
                                                                              : 0.0
                                                                  : 0.0;
                                                            }(MediaQuery.sizeOf(
                                                                        context)
                                                                    .width),
                                                            runSpacing: 0.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children:
                                                                List.generate(
                                                                    items
                                                                        .length,
                                                                    (itemsIndex) {
                                                              final itemsItem =
                                                                  items[
                                                                      itemsIndex];
                                                              return Container(
                                                                width: 120.0,
                                                                height: 121.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .itemEditModels
                                                                      .getModel(
                                                                    itemsItem
                                                                        .id,
                                                                    itemsIndex,
                                                                  ),
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  updateOnChange:
                                                                      true,
                                                                  child:
                                                                      ItemEditWidget(
                                                                    key: Key(
                                                                      'Keypez_${itemsItem.id}',
                                                                    ),
                                                                    imageUrl:
                                                                        itemsItem
                                                                            .imageUrl,
                                                                    name: itemsItem
                                                                        .name,
                                                                    price: itemsItem
                                                                        .price,
                                                                    isActive:
                                                                        itemsItem
                                                                            .isActive,
                                                                    id: itemsItem
                                                                        .id,
                                                                    count: itemsItem
                                                                        .count,
                                                                    remove:
                                                                        () async {
                                                                      await actions
                                                                          .hapticFeedbackForTelegramByType(
                                                                        'impact_light',
                                                                      );
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Container(
                                                                                height: double.infinity,
                                                                                child: DeleteItemWidget(
                                                                                  id: itemsItem.id,
                                                                                  name: itemsItem.name,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    edit:
                                                                        () async {
                                                                      await actions
                                                                          .hapticFeedbackForTelegramByType(
                                                                        'impact_light',
                                                                      );
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        isDismissible:
                                                                            false,
                                                                        enableDrag:
                                                                            false,
                                                                        useSafeArea:
                                                                            true,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Container(
                                                                                height: double.infinity,
                                                                                child: CreateProductWidget(
                                                                                  categories: adminPageItemsRowList.map((e) => e.category).toList().unique((e) => e).sortedList(keyOf: (e) => e, desc: false),
                                                                                  imageUrl: itemsItem.imageUrl,
                                                                                  count: itemsItem.count,
                                                                                  category: categoriesItem,
                                                                                  name: itemsItem.name,
                                                                                  price: itemsItem.price,
                                                                                  id: itemsItem.id,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
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
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: FlutterFlowIconButton(
                                          buttonSize: double.infinity,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          icon: Icon(
                                            Icons.add,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 36.0,
                                          ),
                                          onPressed: () async {
                                            await actions
                                                .hapticFeedbackForTelegramByType(
                                              'impact_light',
                                            );
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              isDismissible: false,
                                              enableDrag: false,
                                              useSafeArea: true,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: double.infinity,
                                                      child:
                                                          CreateProductWidget(
                                                        categories:
                                                            adminPageItemsRowList
                                                                .map((e) =>
                                                                    e.category)
                                                                .toList()
                                                                .unique(
                                                                    (e) => e)
                                                                .sortedList(
                                                                    keyOf:
                                                                        (e) =>
                                                                            e,
                                                                    desc:
                                                                        false),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              KeepAliveWidgetWrapper(
                                builder: (context) => Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 5.0, 5.0, 0.0),
                                        child: Text(
                                          'Кафе начинает работу? Если да, включите, если заканчивает, выключите',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'amoret',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    StreamBuilder<List<FlagsRow>>(
                                      stream: _model.containerSupabaseStream ??=
                                          SupaFlow.client
                                              .from("flags")
                                              .stream(primaryKey: ['name'])
                                              .eqOrNull(
                                                'name',
                                                'working',
                                              )
                                              .map((list) => list
                                                  .map((item) => FlagsRow(item))
                                                  .toList()),
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
                                        List<FlagsRow> containerFlagsRowList =
                                            snapshot.data!;

                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final containerFlagsRow =
                                            containerFlagsRowList.isNotEmpty
                                                ? containerFlagsRowList.first
                                                : null;

                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Switch(
                                                value: _model.switchValue ??=
                                                    containerFlagsRow!.isField,
                                                onChanged: (newValue) async {
                                                  safeSetState(() => _model
                                                      .switchValue = newValue);
                                                  if (newValue) {
                                                    await FlagsTable().update(
                                                      data: {
                                                        'is': true,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eqOrNull(
                                                        'name',
                                                        'working',
                                                      ),
                                                    );
                                                    await actions
                                                        .hapticFeedbackForTelegramByType(
                                                      'impact_light',
                                                    );
                                                  } else {
                                                    await FlagsTable().update(
                                                      data: {
                                                        'is': false,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eqOrNull(
                                                        'name',
                                                        'working',
                                                      ),
                                                    );
                                                    await actions
                                                        .hapticFeedbackForTelegramByType(
                                                      'impact_light',
                                                    );
                                                  }
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                activeTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                inactiveTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                inactiveThumbColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ]
                                      .divide(SizedBox(height: 5.0))
                                      .around(SizedBox(height: 5.0)),
                                ),
                              ),
                              KeepAliveWidgetWrapper(
                                builder: (context) =>
                                    StreamBuilder<List<UsersRow>>(
                                  stream: _model.listViewSupabaseStream ??=
                                      SupaFlow
                                          .client
                                          .from("users")
                                          .stream(primaryKey: ['userId'])
                                          .order('name', ascending: true)
                                          .map((list) => list
                                              .map((item) => UsersRow(item))
                                              .toList()),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 15.0,
                                          height: 15.0,
                                          child: SpinKitThreeBounce(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 15.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<UsersRow> listViewUsersRowList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewUsersRowList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 5.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewUsersRow =
                                            listViewUsersRowList[listViewIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await actions
                                                .hapticFeedbackForTelegramByType(
                                              'impact_light',
                                            );
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              isDismissible: false,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: double.infinity,
                                                      child:
                                                          RoleAssignmentWidget(
                                                        userId: listViewUsersRow
                                                            .userId,
                                                        userNameAndSurname:
                                                            '${listViewUsersRow.name} ${listViewUsersRow.surname}',
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              title: Text(
                                                '${listViewUsersRow.name} ${listViewUsersRow.surname}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'amoret',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                listViewUsersRow.role,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'amoret',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              tileColor: valueOrDefault<Color>(
                                                () {
                                                  if (listViewUsersRow.role ==
                                                      'user') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .secondary;
                                                  } else if (listViewUsersRow
                                                          .role ==
                                                      'worker') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primary;
                                                  } else if (listViewUsersRow
                                                          .role ==
                                                      'admin') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .spaceCadet;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary;
                                                  }
                                                }(),
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                              ),
                                              dense: false,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                              HomePageWidget.routeName,
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
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
