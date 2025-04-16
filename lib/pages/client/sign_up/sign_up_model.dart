import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  Local state fields for this component.

  int? miniOrderCounter = 0;

  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode1;
  TextEditingController? textFieldNameTextController1;
  String? Function(BuildContext, String?)?
      textFieldNameTextController1Validator;
  String? _textFieldNameTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Напишите имя';
    }

    return null;
  }

  // State field(s) for TextFieldSurname widget.
  FocusNode? textFieldSurnameFocusNode1;
  TextEditingController? textFieldSurnameTextController1;
  String? Function(BuildContext, String?)?
      textFieldSurnameTextController1Validator;
  String? _textFieldSurnameTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Напиите фамилию';
    }

    return null;
  }

  // State field(s) for TextFieldPhone widget.
  FocusNode? textFieldPhoneFocusNode1;
  TextEditingController? textFieldPhoneTextController1;
  String? Function(BuildContext, String?)?
      textFieldPhoneTextController1Validator;
  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode2;
  TextEditingController? textFieldNameTextController2;
  String? Function(BuildContext, String?)?
      textFieldNameTextController2Validator;
  String? _textFieldNameTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Напишите свое имя';
    }

    return null;
  }

  // State field(s) for TextFieldSurname widget.
  FocusNode? textFieldSurnameFocusNode2;
  TextEditingController? textFieldSurnameTextController2;
  String? Function(BuildContext, String?)?
      textFieldSurnameTextController2Validator;
  String? _textFieldSurnameTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Напишите свою фамилию';
    }

    return null;
  }

  // State field(s) for TextFieldPhone widget.
  FocusNode? textFieldPhoneFocusNode2;
  TextEditingController? textFieldPhoneTextController2;
  String? Function(BuildContext, String?)?
      textFieldPhoneTextController2Validator;
  String? _textFieldPhoneTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Напишите свой номер телефона';
    }

    if (val.length < 12) {
      return 'Необходимо написать 12 цифр';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  OrdersRow? order1;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  OrdersRow? order2;

  @override
  void initState(BuildContext context) {
    textFieldNameTextController1Validator =
        _textFieldNameTextController1Validator;
    textFieldSurnameTextController1Validator =
        _textFieldSurnameTextController1Validator;
    textFieldNameTextController2Validator =
        _textFieldNameTextController2Validator;
    textFieldSurnameTextController2Validator =
        _textFieldSurnameTextController2Validator;
    textFieldPhoneTextController2Validator =
        _textFieldPhoneTextController2Validator;
  }

  @override
  void dispose() {
    textFieldNameFocusNode1?.dispose();
    textFieldNameTextController1?.dispose();

    textFieldSurnameFocusNode1?.dispose();
    textFieldSurnameTextController1?.dispose();

    textFieldPhoneFocusNode1?.dispose();
    textFieldPhoneTextController1?.dispose();

    textFieldNameFocusNode2?.dispose();
    textFieldNameTextController2?.dispose();

    textFieldSurnameFocusNode2?.dispose();
    textFieldSurnameTextController2?.dispose();

    textFieldPhoneFocusNode2?.dispose();
    textFieldPhoneTextController2?.dispose();
  }
}
