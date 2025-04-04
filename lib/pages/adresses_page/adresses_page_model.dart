import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'adresses_page_widget.dart' show AdressesPageWidget;
import 'package:flutter/material.dart';

class AdressesPageModel extends FlutterFlowModel<AdressesPageWidget> {
  ///  Local state fields for this page.

  List<String> addresses = [];
  void addToAddresses(String item) => addresses.add(item);
  void removeFromAddresses(String item) => addresses.remove(item);
  void removeAtIndexFromAddresses(int index) => addresses.removeAt(index);
  void insertAtIndexInAddresses(int index, String item) =>
      addresses.insert(index, item);
  void updateAddressesAtIndex(int index, Function(String) updateFn) =>
      addresses[index] = updateFn(addresses[index]);

  ///  State fields for stateful widgets in this page.

  var qRScan = '';
  // Stores action output result for [Custom Action - getRandomKey] action in RandomKeyButton widget.
  String? randomKey;
  // State field(s) for WIFKeyTextField widget.
  FocusNode? wIFKeyTextFieldFocusNode;
  TextEditingController? wIFKeyTextFieldTextController;
  String? Function(BuildContext, String?)?
      wIFKeyTextFieldTextControllerValidator;
  // State field(s) for DefaultAddressRadioButton widget.
  FormFieldController<String>? defaultAddressRadioButtonValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    wIFKeyTextFieldFocusNode?.dispose();
    wIFKeyTextFieldTextController?.dispose();
  }

  /// Additional helper methods.
  String? get defaultAddressRadioButtonValue =>
      defaultAddressRadioButtonValueController?.value;
}
