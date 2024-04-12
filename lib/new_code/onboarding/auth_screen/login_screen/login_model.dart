import 'package:flutter/material.dart';

import '../../../../flutter_flow/flutter_flow_model.dart';
import 'login_screen.dart';


class LoginModel extends FlutterFlowModel<LoginScreen> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode1;
  TextEditingController? phoneNumberController1;
  String? Function(BuildContext, String?)? phoneNumberController1Validator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode2;
  TextEditingController? phoneNumberController2;
  String? Function(BuildContext, String?)? phoneNumberController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    phoneNumberFocusNode1?.dispose();
    phoneNumberController1?.dispose();

    phoneNumberFocusNode2?.dispose();
    phoneNumberController2?.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
// Container(
//   width: double.infinity,
//   child: IntlPhoneField(
//       initialCountryCode: 'IN',
//       textInputAction: TextInputAction.send,
//       focusNode: _model.phoneNumberFocusNode2,
//       keyboardType: TextInputType.phone,
//       textAlign: TextAlign.start,
//       flagsButtonMargin: EdgeInsets.only(left: 8.0.w,right: 24.0.w,top: 2.0.w,bottom: 2.0.w),
//       dropdownDecoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8.0),
//         color: Color(0xFF0E2B33),
//
//       ),
//       dropdownIcon: Icon(Icons.arrow_drop_down,color: FlutterFlowTheme.of(context).primaryBackground,),
//       dropdownTextStyle: TextStyle(
//         color: FlutterFlowTheme.of(context).primaryBackground
//       ),
//       decoration: InputDecoration(
//           counterText: '',
//           filled: true,
//           fillColor: Color(0xFF153C47),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0.w),
//             borderSide: BorderSide(
//               color: Color(0xFF0E2B33)
//             ),
//           ),
//         hintText: "Enter mobile number"
//       ),
//       onChanged: (phone) {
//         print(phone.completeNumber);
//        _model.phoneNumberController1.text =  phone.countryCode;
//        _model.phoneNumberController2.text = phone.number;
//        print(_model.phoneNumberController1.text);
//        print(_model.phoneNumberController2.text);
//
//       }),
// )