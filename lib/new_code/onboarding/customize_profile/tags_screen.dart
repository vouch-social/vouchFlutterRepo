import 'package:auto_size_text/auto_size_text.dart';
import 'package:choose_input_chips/choose_input_chips.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/onboarding/customize_profile/user_details.dart';
import 'package:vouch/new_code/onboarding/customize_profile/user_details_controller.dart';

import '../../../flutter_flow/flutter_flow_widgets.dart';

class TagsScreen extends StatefulWidget {
  const TagsScreen({super.key});

  @override
  State<TagsScreen> createState() => _TagsScreenState();
}

class _TagsScreenState extends State<TagsScreen> {
  final _chipKey = GlobalKey<ChipsInputState>();
  final _controller = Get.put(UserDetailsController());

  @override
  Widget build(BuildContext context) {
    const mockResults = <Tags>[
      Tags('John Doe', ),
      Tags('Paul', ),
      Tags('Fred', ),
      Tags('Brian',),
      Tags('John', ),
      Tags('Thomas',),
      Tags('Nelly', ),
      Tags('Marie', ),
      Tags('Charlie', ),
      Tags('Diana', ),
      Tags('Ernie', ),
      Tags('Gina', ),
    ];

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.h),
          child: Column(
            children: [
              SizedBox(
                height: 60.0.h,
              ),
              Hero(
                tag: "Tags",
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ChipsInput(
                      suggestionsBoxMaxHeight: 200.0.h,
                      suggestionsBoxDecoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground
                      ),
                      maxChips: 3,
                      decoration: InputDecoration(
                        labelText: "Tags",
                        floatingLabelStyle:
                        FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Bricolage Grotesque',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: FlutterFlowTheme.of(context)
                              .secondaryBackground,
                          useGoogleFonts: false,
                        ),
                        labelStyle:
                        FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Bricolage Grotesque',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: FlutterFlowTheme.of(context)
                              .secondaryBackground,
                          useGoogleFonts: false,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      findSuggestions: (String query) {
                        if (query.isNotEmpty) {
                          var lowercaseQuery = query.toLowerCase();
                          final results = mockResults.where((profile) {
                            return profile.tags
                                    .toLowerCase()
                                    .contains(query.toLowerCase());
                          }).toList(growable: false)
                            ..sort((a, b) => a.tags
                                .toLowerCase()
                                .indexOf(lowercaseQuery)
                                .compareTo(
                                    b.tags.toLowerCase().indexOf(lowercaseQuery)));
                          return results;
                        }
                        return mockResults;
                      },
                      onChanged: (List<Tags> tags) {
                        _controller.tagsController.value = tags;
                      },

                      chipBuilder: (context, state, Tags profile) {
                        return InputChip(
                          key: ObjectKey(profile),
                          label: Text(profile.tags),
                          onDeleted: () => state.deleteChip(profile),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        );
                      },
                      suggestionBuilder: (context,state, Tags profile) {
                        return Wrap(
                          children: [InputChip(
                                  key: ObjectKey(profile),
                                  label: Text(profile.tags),
                            onPressed: () => state.selectSuggestion(profile),
                          ),]
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.0.h,
              ),
              const Spacer(),
              FFButtonWidget(
                onPressed: () async {
                  // logFirebaseEvent(
                  //     'PERMISSIONS_START_BUILDING_NETWORK_BTN_O');
                  // logFirebaseEvent('Button_request_permissions');
                  // logFirebaseEvent('Button_navigate_to');
                  if(_controller.tagsController.isEmpty){
                    const SnackBar(
                      content: Text(
                          'Please Choose Your Tags'),
                    );
                  }else {
                    print("${_controller.tagsController}");
                    await _controller.saveUserController();
                    //_controller.sendUserAttributesController();
                  }
                },
                text: 'Update Your Profile',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 64.0.h,
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Bricolage Grotesque',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Tags {
  final String tags;


  const Tags(this.tags,);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tags &&
          runtimeType == other.runtimeType &&
          tags == other.tags;

  @override
  int get hashCode => tags.hashCode;

  @override
  String toString() {
    return tags;
  }
}
