import 'package:choose_input_chips/choose_input_chips.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';

import '../../../../flutter_flow/flutter_flow_widgets.dart';
import '../../../common_widgets/myAppBar.dart';
import 'edit_profile_controller.dart';

class EditTagsScreen extends StatefulWidget {
  const EditTagsScreen({super.key});

  @override
  State<EditTagsScreen> createState() => _EditTagsScreenState();
}

class _EditTagsScreenState extends State<EditTagsScreen> {
  final _chipKey = GlobalKey<ChipsInputState>();
  final _controller = Get.put(EditProfileController());

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
      appBar: CustomAppBar(
        title: "Edit Tags",
        showBackButton: true,
        showProfileButton: false,
        showNotificationButton: false,
        showHistoryButton: false,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.h),
          child: Column(
            children: [

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
                      textStyle: FlutterFlowTheme.of(context).titleSmall,
                      initialValue : _controller.tagsController,
                      suggestionsBoxMaxHeight: 180.0.h,
                      suggestionsBoxDecoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground
                      ),

                      maxChips: 3,
                      decoration: InputDecoration(
                        labelText: "Tags",
                        floatingLabelStyle:
                        FlutterFlowTheme.of(context).bodyLarge,
                        labelStyle:
                        FlutterFlowTheme.of(context).bodyLarge,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).ffButton.withOpacity(0.3),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).ffButton.withOpacity(0.3),
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
                          deleteIcon : Icon(Icons.clear,color: FlutterFlowTheme.of(context).primaryText,size: 16.0.h,),
                          labelStyle: FlutterFlowTheme.of(context).labelSmall,
                          backgroundColor: MediaQuery.of(context).platformBrightness == Brightness.dark ?
                          FlutterFlowTheme.of(context).primaryBackground.withOpacity(0.9):
                          FlutterFlowTheme.of(context).secondaryBackground.withOpacity(0.1),
                          key: ObjectKey(profile),
                          label: Text(profile.tags),
                          onDeleted: () => state.deleteChip(profile),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        );
                      },
                      suggestionBuilder: (context,state, Tags profile) {
                        return Wrap(
                            children: [InputChip(
                              side :BorderSide.none,
                              backgroundColor: MediaQuery.of(context).platformBrightness == Brightness.dark ?
                              FlutterFlowTheme.of(context).primaryBackground.withOpacity(0.9):
                              FlutterFlowTheme.of(context).secondaryBackground.withOpacity(0.1),
                              labelStyle: FlutterFlowTheme.of(context).labelSmall,
                              elevation: 0,
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
                    print("Tags 1: ${_controller.tagsController}");

                    // await _controller.sendUserAttributesController();
                    Get.back();
                  }
                },
                text: 'Update Your Profile',
                options: CTAButton(context),
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
