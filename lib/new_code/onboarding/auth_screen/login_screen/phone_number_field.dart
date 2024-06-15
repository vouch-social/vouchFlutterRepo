import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../flutter_flow/flutter_flow_theme.dart';

Widget phoneInputField(model, context) {
  String removeCountryCode(String fullPhoneNumber, String dialCode) {
    return fullPhoneNumber.replaceFirst(dialCode, '');
  }

  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  return InternationalPhoneNumberInput(
    onInputChanged: (PhoneNumber number) {
      model.phoneNumberController2.text = number.phoneNumber!;
      model.phoneNumberController1.text = number.dialCode!;
    },
    selectorTextStyle: TextStyle(
      color: FlutterFlowTheme.of(context).fixedBlack,
      fontSize: 22.0.w,
      fontWeight: FontWeight.w400,
      fontFamily: 'Bricolage Grotesque',
      backgroundColor: Colors.white,
    ),
    cursorColor: FlutterFlowTheme.of(context).primary,
    // scrollPadding: const EdgeInsets.all(20.0),
    initialValue: number,
    autoFocus: true,
    autoFocusSearch: true,
    keyboardAction: TextInputAction.send,
    selectorConfig: SelectorConfig(
      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
      // useBottomSheetSafeArea: true,
      setSelectorButtonAsPrefixIcon: true,
      leadingPadding: 20.0.w,
    ),
    textStyle: FlutterFlowTheme.of(context).headlineLarge,
    focusNode: model.phoneNumberFocusNode2,
    // inputBorder: InputBorder.none,

    inputDecoration: InputDecoration(
      errorText: '',
      // errorBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(8.0.w)),
      //   // borderSide: BorderSide(
      //   //     strokeAlign: BorderSide.strokeAlignCenter,
      //   //     color: FlutterFlowTheme.of(context).textFieldBackground),
      // ),
      // focusedErrorBorder:
      // OutlineInputBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(8.0.w)),
      //   // borderSide: BorderSide(
      //   //     strokeAlign: BorderSide.strokeAlignCenter,
      //   //     color: FlutterFlowTheme.of(context).textFieldBackground),
      // ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(8.0.w)),
      ),
      hintText: "Enter mobile number",
      hintStyle: TextStyle(
        fontSize: 18.w,
        fontWeight: FontWeight.w300,
        fontFamily: 'Bricolage Grotesque',
        color: FlutterFlowTheme.of(context).primaryText.withAlpha(51),
      ),
    ),
    autoValidateMode: AutovalidateMode.onUserInteraction,
  );
}
