import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'create_product_model.dart';
export 'create_product_model.dart';

class CreateProductWidget extends StatefulWidget {
  const CreateProductWidget({
    super.key,
    this.imageUrl,
    this.count,
    this.category,
    this.name,
    this.price,
    required this.categories,
    this.id,
  });

  final String? imageUrl;
  final int? count;
  final String? category;
  final String? name;
  final double? price;
  final List<String>? categories;
  final String? id;

  @override
  State<CreateProductWidget> createState() => _CreateProductWidgetState();
}

class _CreateProductWidgetState extends State<CreateProductWidget> {
  late CreateProductModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateProductModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {});
    });

    _model.textFieldTypeTextController ??=
        TextEditingController(text: widget.category);
    _model.textFieldTypeFocusNode ??= FocusNode();

    _model.textFieldNameTextController ??=
        TextEditingController(text: widget.name);
    _model.textFieldNameFocusNode ??= FocusNode();

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
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 74.0,
                    height: 74.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: ((_model.uploadedLocalFile1.bytes?.isEmpty ??
                                        true)) &&
                                (widget.imageUrl == null ||
                                    widget.imageUrl == '')
                            ? FlutterFlowTheme.of(context).tertiary
                            : FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.photo,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                        if (widget.imageUrl != null && widget.imageUrl != '')
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 0),
                                fadeOutDuration: Duration(milliseconds: 0),
                                imageUrl: widget.imageUrl!,
                                width: 74.0,
                                height: 74.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                maxWidth: 74.00,
                                maxHeight: 74.00,
                                allowPhoto: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(
                                    () => _model.isDataUploading1 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();
                                } finally {
                                  _model.isDataUploading1 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                    selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile1 =
                                        selectedUploadedFiles.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.memory(
                                _model.uploadedLocalFile1.bytes ??
                                    Uint8List.fromList([]),
                                width: 74.0,
                                height: 74.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 74.0,
                      decoration: BoxDecoration(),
                      child: Container(
                        width: 120.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: FlutterFlowCountController(
                          decrementIconBuilder: (enabled) => Icon(
                            Icons.remove_rounded,
                            color: enabled
                                ? FlutterFlowTheme.of(context).secondaryText
                                : FlutterFlowTheme.of(context).alternate,
                            size: 24.0,
                          ),
                          incrementIconBuilder: (enabled) => Icon(
                            Icons.add_rounded,
                            color: enabled
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).alternate,
                            size: 24.0,
                          ),
                          countBuilder: (count) => Text(
                            count.toString(),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Roboto',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          count: _model.countControllerValue1 ??=
                              valueOrDefault<int>(
                            widget.count,
                            0,
                          ),
                          updateCount: (count) => safeSetState(
                              () => _model.countControllerValue1 = count),
                          stepSize: 1,
                          minimum: 0,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 15.0)),
              ),
            ),
            Text(
              'Категория:',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
            ),
            FlutterFlowRadioButton(
              options: ['Выбрать из существующих', 'Создать новую'].toList(),
              onChanged: (val) => safeSetState(() {}),
              controller: _model.radioButtonValueController ??=
                  FormFieldController<String>(valueOrDefault<String>(
                widget.categories != null && (widget.categories)!.isNotEmpty
                    ? 'Выбрать из существующих'
                    : 'Создать новую',
                'Создать новую',
              )),
              optionHeight: 32.0,
              textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
              selectedTextStyle:
                  FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
              buttonPosition: RadioButtonPosition.left,
              direction: Axis.vertical,
              radioButtonColor: FlutterFlowTheme.of(context).primary,
              inactiveRadioButtonColor:
                  FlutterFlowTheme.of(context).secondaryText,
              toggleable: false,
              horizontalAlignment: WrapAlignment.start,
              verticalAlignment: WrapCrossAlignment.start,
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: _model.dropDownValue == null ||
                              _model.dropDownValue == ''
                          ? FlutterFlowTheme.of(context).tertiary
                          : FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController ??=
                        FormFieldController<String>(
                      _model.dropDownValue ??= widget.category,
                    ),
                    options: widget.categories!,
                    onChanged: (val) =>
                        safeSetState(() => _model.dropDownValue = val),
                    width: double.infinity,
                    height: 49.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    hintText: 'Выбрать категорию...',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ),
                if (_model.radioButtonValue == 'Создать новую')
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: _model.textFieldTypeTextController.text == ''
                            ? FlutterFlowTheme.of(context).tertiary
                            : FlutterFlowTheme.of(context).alternate,
                      ),
                    ),
                    child: TextFormField(
                      controller: _model.textFieldTypeTextController,
                      focusNode: _model.textFieldTypeFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textFieldTypeTextController',
                        Duration(milliseconds: 200),
                        () => safeSetState(() {}),
                      ),
                      autofocus: false,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Категория',
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).tertiary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).tertiary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                      minLines: 1,
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator: _model.textFieldTypeTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: _model.textFieldNameTextController.text == ''
                      ? FlutterFlowTheme.of(context).tertiary
                      : FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: TextFormField(
                controller: _model.textFieldNameTextController,
                focusNode: _model.textFieldNameFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textFieldNameTextController',
                  Duration(milliseconds: 200),
                  () => safeSetState(() {}),
                ),
                autofocus: false,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Название',
                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).error,
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).tertiary,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).tertiary,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                minLines: 1,
                cursorColor: FlutterFlowTheme.of(context).primaryText,
                validator: _model.textFieldNameTextControllerValidator
                    .asValidator(context),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    'Цена: ${_model.countControllerValue2?.toString()}.${_model.countControllerValue3?.toString()} р.',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: 120.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: FlutterFlowCountController(
                      decrementIconBuilder: (enabled) => Icon(
                        Icons.remove_rounded,
                        color: enabled
                            ? FlutterFlowTheme.of(context).secondaryText
                            : FlutterFlowTheme.of(context).alternate,
                        size: 24.0,
                      ),
                      incrementIconBuilder: (enabled) => Icon(
                        Icons.add_rounded,
                        color: enabled
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).alternate,
                        size: 24.0,
                      ),
                      countBuilder: (count) => Text(
                        count.toString(),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                      ),
                      count: _model.countControllerValue2 ??=
                          valueOrDefault<int>(
                        widget.price?.toInt(),
                        0,
                      ),
                      updateCount: (count) => safeSetState(
                          () => _model.countControllerValue2 = count),
                      stepSize: 1,
                      minimum: 0,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: 120.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: FlutterFlowCountController(
                      decrementIconBuilder: (enabled) => Icon(
                        Icons.remove_rounded,
                        color: enabled
                            ? FlutterFlowTheme.of(context).secondaryText
                            : FlutterFlowTheme.of(context).alternate,
                        size: 24.0,
                      ),
                      incrementIconBuilder: (enabled) => Icon(
                        Icons.add_rounded,
                        color: enabled
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).alternate,
                        size: 24.0,
                      ),
                      countBuilder: (count) => Text(
                        count.toString(),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                      ),
                      count: _model.countControllerValue3 ??=
                          valueOrDefault<int>(
                        (((widget.price ?? 0) - (widget.price ?? 0).toInt()) *
                                10)
                            .toInt(),
                        0,
                      ),
                      updateCount: (count) => safeSetState(
                          () => _model.countControllerValue3 = count),
                      stepSize: 1,
                      minimum: 0,
                      maximum: 9,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 3.0)),
            ),
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                      await actions.hapticFeedbackForTelegramByType(
                        'notification_error',
                      );
                    },
                    text: 'Отмена',
                    options: FFButtonOptions(
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                    ),
                  ),
                ),
                Expanded(
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (((_model.radioButtonValue ==
                                  'Выбрать из существующих') &&
                              (_model.dropDownValue != null &&
                                  _model.dropDownValue != '') &&
                              (_model.textFieldNameTextController.text !=
                                      '')) ||
                          ((_model.radioButtonValue == 'Создать новую') &&
                              (_model.textFieldTypeTextController.text !=
                                      '') &&
                              (_model.textFieldNameTextController.text !=
                                      ''))) {
                        if ((_model.uploadedLocalFile1.bytes?.isNotEmpty ??
                                false)) {
                          // Action 1
                          {
                            safeSetState(() => _model.isDataUploading2 = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];
                            var selectedMedia = <SelectedFile>[];
                            var downloadUrls = <String>[];
                            try {
                              selectedUploadedFiles =
                                  _model.uploadedLocalFile1.bytes!.isNotEmpty
                                      ? [_model.uploadedLocalFile1]
                                      : <FFUploadedFile>[];
                              selectedMedia = selectedFilesFromUploadedFiles(
                                selectedUploadedFiles,
                                storageFolderPath: 'images',
                              );
                              downloadUrls = await uploadSupabaseStorageFiles(
                                bucketName: 'items',
                                selectedFiles: selectedMedia,
                              );
                            } finally {
                              _model.isDataUploading2 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile2 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl2 = downloadUrls.first;
                              });
                            } else {
                              safeSetState(() {});
                              return;
                            }
                          }

                          if (widget.id != null && widget.id != '') {
                            await ItemsTable().update(
                              data: {
                                'name': _model.textFieldNameTextController.text,
                                'price': (int var1, int var2) {
                                  return double.parse(
                                      var1.toString() + '.' + var2.toString());
                                }(_model.countControllerValue2!,
                                    _model.countControllerValue3!),
                                'category': _model.radioButtonValue ==
                                        'Создать новую'
                                    ? _model.textFieldTypeTextController.text
                                    : _model.dropDownValue,
                                'imageUrl': _model.uploadedFileUrl2,
                                'count': _model.countControllerValue1,
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'id',
                                widget.id,
                              ),
                            );
                            await actions.hapticFeedbackForTelegramByType(
                              'notification_success',
                            );
                            Navigator.pop(context);
                          } else {
                            await ItemsTable().insert({
                              'name': _model.textFieldNameTextController.text,
                              'price': (int var1, int var2) {
                                return double.parse(
                                    var1.toString() + '.' + var2.toString());
                              }(_model.countControllerValue2!,
                                  _model.countControllerValue3!),
                              'category':
                                  _model.radioButtonValue == 'Создать новую'
                                      ? _model.textFieldTypeTextController.text
                                      : _model.dropDownValue,
                              'isActive': true,
                              'imageUrl': _model.uploadedFileUrl2,
                              'count': _model.countControllerValue1,
                            });
                            await actions.hapticFeedbackForTelegramByType(
                              'notification_success',
                            );
                            Navigator.pop(context);
                          }
                        } else {
                          if (widget.categories!.length > 0) {
                            await ItemsTable().update(
                              data: {
                                'name': _model.textFieldNameTextController.text,
                                'price': (int var1, int var2) {
                                  return double.parse(
                                      var1.toString() + '.' + var2.toString());
                                }(_model.countControllerValue2!,
                                    _model.countControllerValue3!),
                                'category': _model.radioButtonValue ==
                                        'Создать новую'
                                    ? _model.textFieldTypeTextController.text
                                    : _model.dropDownValue,
                                'count': _model.countControllerValue1,
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'id',
                                widget.id,
                              ),
                            );
                            await actions.hapticFeedbackForTelegramByType(
                              'notification_success',
                            );
                            Navigator.pop(context);
                          } else {
                            await actions.hapticFeedbackForTelegramByType(
                              'notification_error',
                            );
                          }
                        }
                      } else {
                        await actions.hapticFeedbackForTelegramByType(
                          'notification_error',
                        );
                      }
                    },
                    text: 'Сохранить',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      padding: EdgeInsets.all(8.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 3.0)).around(SizedBox(width: 3.0)),
            ),
          ].divide(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 6.0)),
        ),
      ),
    );
  }
}
