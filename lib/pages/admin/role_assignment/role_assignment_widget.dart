import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'role_assignment_model.dart';
export 'role_assignment_model.dart';

class RoleAssignmentWidget extends StatefulWidget {
  const RoleAssignmentWidget({
    super.key,
    required this.userId,
    required this.userNameAndSurname,
  });

  final int? userId;
  final String? userNameAndSurname;

  @override
  State<RoleAssignmentWidget> createState() => _RoleAssignmentWidgetState();
}

class _RoleAssignmentWidgetState extends State<RoleAssignmentWidget> {
  late RoleAssignmentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoleAssignmentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.userNameAndSurname!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  await UsersTable().update(
                    data: {
                      'role': 'user',
                    },
                    matchingRows: (rows) => rows.eqOrNull(
                      'userId',
                      widget.userId,
                    ),
                  );
                  Navigator.pop(context);
                  await actions.hapticFeedbackForTelegramByType(
                    'notification_success',
                  );
                },
                text: 'Обычный пользователь',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: EdgeInsets.all(8.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  await UsersTable().update(
                    data: {
                      'role': 'worker',
                    },
                    matchingRows: (rows) => rows.eqOrNull(
                      'userId',
                      widget.userId,
                    ),
                  );
                  Navigator.pop(context);
                  await actions.hapticFeedbackForTelegramByType(
                    'notification_success',
                  );
                },
                text: 'Назначить работником',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: EdgeInsets.all(8.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  await UsersTable().update(
                    data: {
                      'role': 'admin',
                    },
                    matchingRows: (rows) => rows.eqOrNull(
                      'userId',
                      widget.userId,
                    ),
                  );
                  Navigator.pop(context);
                  await actions.hapticFeedbackForTelegramByType(
                    'notification_success',
                  );
                },
                text: 'Назначить администратором',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: EdgeInsets.all(8.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF102C54),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              Spacer(),
              FFButtonWidget(
                onPressed: () async {
                  await UsersTable().update(
                    data: {
                      'role': 'ban_user',
                    },
                    matchingRows: (rows) => rows.eqOrNull(
                      'userId',
                      widget.userId,
                    ),
                  );
                  Navigator.pop(context);
                  await actions.hapticFeedbackForTelegramByType(
                    'notification_success',
                  );
                },
                text: 'Забанить пользователя',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: EdgeInsets.all(8.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).tertiary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ].divide(SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
