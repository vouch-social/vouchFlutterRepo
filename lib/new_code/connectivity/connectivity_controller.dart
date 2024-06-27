import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';

class InternetController extends GetxController{

final Connectivity _connectivity = Connectivity();

@override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(InternetStatus);
  }

  InternetStatus(ConnectivityResult cr){
  if(cr == ConnectivityResult.none){
    Get.rawSnackbar(
      title: "No Internet Connection",
      message: "Connect to internet to proceed",
      icon: Icon(Icons.wifi_off,color: Colors.white,),
      isDismissible: false,
      duration: Duration(days: 1),
      shouldIconPulse: true,
    );
  }else{
    if(Get.isSnackbarOpen){
      Get.closeCurrentSnackbar();
    }
  }
  }
}
// Get.rawSnackbar(
// title: Container(
// width: double.infinity,
// height: Get.size.height*(0.954),
// child: Column(
// children: [
//   Center(
// child: Icon(Icons.wifi_off,size: 120.0.w,color: FlutterFlowTheme.of(context).primaryText,
// ),
// AutoSizeText("No internet connection"),
// )
// ],
// ),
// ),
// message: "Connect to internet to proceed",
// // icon: Icon(Icons.wifi_off,color: Colors.white,),
// isDismissible: true,
// duration: Duration(days: 1),
// shouldIconPulse: true,
// );