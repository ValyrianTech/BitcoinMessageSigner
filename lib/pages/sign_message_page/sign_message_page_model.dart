import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'sign_message_page_widget.dart' show SignMessagePageWidget;
import 'package:flutter/material.dart';

class SignMessagePageModel extends FlutterFlowModel<SignMessagePageWidget> {
  ///  Local state fields for this page.

  dynamic data;

  String msg = 'no message';

  String url = 'no url';

  String addr = 'no addr';

  ///  State fields for stateful widgets in this page.

  var qRScan = '';
  // State field(s) for SelectedAddressDropDown widget.
  String? selectedAddressDropDownValue;
  FormFieldController<String>? selectedAddressDropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
