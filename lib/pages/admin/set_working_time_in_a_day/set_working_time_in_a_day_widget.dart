import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'set_working_time_in_a_day_model.dart';
export 'set_working_time_in_a_day_model.dart';

class SetWorkingTimeInADayWidget extends StatefulWidget {
  const SetWorkingTimeInADayWidget({
    super.key,
    required this.day,
    required this.from,
    required this.to,
    required this.isActive,
  });

  final String? day;
  final DateTime? from;
  final DateTime? to;
  final bool? isActive;

  @override
  State<SetWorkingTimeInADayWidget> createState() =>
      _SetWorkingTimeInADayWidgetState();
}

class _SetWorkingTimeInADayWidgetState
    extends State<SetWorkingTimeInADayWidget> {
  late SetWorkingTimeInADayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetWorkingTimeInADayModel());

    _model.switchValue = widget.isActive!;
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
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.day,
                      'День',
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Switch(
                  value: _model.switchValue!,
                  onChanged: (newValue) async {
                    safeSetState(() => _model.switchValue = newValue);
                    if (newValue) {
                      await WorkingTimeTable().update(
                        data: {
                          'isActive': true,
                        },
                        matchingRows: (rows) => rows.eqOrNull(
                          'day',
                          widget.day,
                        ),
                      );
                    } else {
                      await WorkingTimeTable().update(
                        data: {
                          'isActive': false,
                        },
                        matchingRows: (rows) => rows.eqOrNull(
                          'day',
                          widget.day,
                        ),
                      );
                    }
                  },
                  activeColor: FlutterFlowTheme.of(context).secondaryText,
                  activeTrackColor: FlutterFlowTheme.of(context).primary,
                  inactiveTrackColor: FlutterFlowTheme.of(context).tertiary,
                  inactiveThumbColor:
                      FlutterFlowTheme.of(context).secondaryText,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                AutoSizeText(
                  'С',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: 100.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                    ),
                    child: FFButtonWidget(
                      onPressed: !_model.switchValue!
                          ? null
                          : () async {
                              await showModalBottomSheet<bool>(
                                  context: context,
                                  builder: (context) {
                                    return ScrollConfiguration(
                                      behavior: const MaterialScrollBehavior()
                                          .copyWith(
                                        dragDevices: {
                                          PointerDeviceKind.mouse,
                                          PointerDeviceKind.touch,
                                          PointerDeviceKind.stylus,
                                          PointerDeviceKind.unknown
                                        },
                                      ),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: CupertinoDatePicker(
                                          mode: CupertinoDatePickerMode.time,
                                          minimumDate: DateTime(1900),
                                          initialDateTime:
                                              (widget.from ?? DateTime.now()),
                                          maximumDate: DateTime(2050),
                                          use24hFormat: false,
                                          onDateTimeChanged: (newDateTime) =>
                                              safeSetState(() {
                                            _model.datePicked1 = newDateTime;
                                          }),
                                        ),
                                      ),
                                    );
                                  });
                              if (_model.datePicked1 != null) {
                                if (_model.datePicked1! < widget.to!) {
                                  _model.buttonFromLabel = _model.datePicked1;
                                  _model.updatePage(() {});
                                  await WorkingTimeTable().update(
                                    data: {
                                      'from': supaSerialize<PostgresTime>(
                                          PostgresTime(_model.datePicked1)),
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'day',
                                      widget.day,
                                    ),
                                  );
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Неправильное время!'),
                                        content: Text(
                                            'Время открытия должно быть раньше, чем закрытия.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Время не изменено!'),
                                      content: Text(
                                          'Вы не изменили время открытия.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                      text: _model.buttonFromLabel == null
                          ? dateTimeFormat("Hm", widget.from)
                          : dateTimeFormat("Hm", _model.buttonFromLabel),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                        disabledColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                    ),
                  ),
                ),
                AutoSizeText(
                  'ДО',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: 100.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                    ),
                    child: FFButtonWidget(
                      onPressed: !_model.switchValue!
                          ? null
                          : () async {
                              await showModalBottomSheet<bool>(
                                  context: context,
                                  builder: (context) {
                                    return ScrollConfiguration(
                                      behavior: const MaterialScrollBehavior()
                                          .copyWith(
                                        dragDevices: {
                                          PointerDeviceKind.mouse,
                                          PointerDeviceKind.touch,
                                          PointerDeviceKind.stylus,
                                          PointerDeviceKind.unknown
                                        },
                                      ),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: CupertinoDatePicker(
                                          mode: CupertinoDatePickerMode.time,
                                          minimumDate: DateTime(1900),
                                          initialDateTime:
                                              (widget.to ?? DateTime.now()),
                                          maximumDate: DateTime(2050),
                                          use24hFormat: false,
                                          onDateTimeChanged: (newDateTime) =>
                                              safeSetState(() {
                                            _model.datePicked2 = newDateTime;
                                          }),
                                        ),
                                      ),
                                    );
                                  });
                              if (_model.datePicked2 != null) {
                                if (_model.datePicked2! > widget.from!) {
                                  _model.buttonToLabel = _model.datePicked2;
                                  _model.updatePage(() {});
                                  await WorkingTimeTable().update(
                                    data: {
                                      'to': supaSerialize<PostgresTime>(
                                          PostgresTime(_model.datePicked2)),
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'day',
                                      widget.day,
                                    ),
                                  );
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Неправильное время'),
                                        content: Text(
                                            'Время закрытия должно быть позже, чем открытия.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Время не изменено!'),
                                      content: Text(
                                          'Вы не изменили время закрытия.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                      text: _model.buttonToLabel == null
                          ? dateTimeFormat("Hm", widget.to)
                          : dateTimeFormat("Hm", _model.buttonToLabel),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                        disabledColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ),
        ],
      ),
    );
  }
}
