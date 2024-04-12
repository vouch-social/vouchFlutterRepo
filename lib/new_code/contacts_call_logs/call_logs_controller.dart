// import 'package:get/get.dart';
//
// import '../../custom_code/actions/hashed_phone.dart';
// import '../backend/network/dio_client.dart';
// import '../backend/repos/contacts_call_logs_repo.dart';
//
// class CallLogsController extends GetxController{
//
//   final CallLogsRepo repository = CallLogsRepo();
//   late final DioClient _dioClient;
//   CallLogsController() {
//     _dioClient = DioClient(); // Initialize DioClient
//   }
//
//
//
//
//
//   void sendCallLogsData() async{
//
//
//
//     var data = {
//       'hashedPhone' : hashedPhone('9999999999'),
//       'callLogs': callLogsToJson()
//     };
//
//     try{
//
//       await repository.sendCallLogs(data['hashedPhone'],);
//
//     }catch(error){
//       print(error);
//     }
//   }
//
// }