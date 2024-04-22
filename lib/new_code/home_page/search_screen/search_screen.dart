import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final _controller = Get.put(SearchController());
  bool _showSendIcon = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            children: [
              Spacer(),
              Row(
                children: [
                  Hero(
                    tag: "Search",
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                          height: 52.h,
                          width: MediaQuery.of(context).size.width - 88.w,
                          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0.w),
                            color: FlutterFlowTheme.of(context).textFieldBackground,
                          ),
                          child: TextFormField(
                            autofocus: true,
                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                            onChanged: (text) {
                              setState(() {
                                _showSendIcon = text.isNotEmpty;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Type,talk,ask?",
                              hintStyle: FlutterFlowTheme.of(context).titleSmall,
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none
                              )
                            ),
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.w),
                          color: FlutterFlowTheme.of(context).primary),
                      child: Icon(
                        _showSendIcon ? Icons.send : Icons.add, color: FlutterFlowTheme.of(context).white,
                      ),
                    ),
                    onTap: () {
                      if (_showSendIcon) {

                      } else {

                      }
                    },
                  )
                ]
              )
            ],
          ),
        ),
      )
    );
  }
}
