import 'package:get/get.dart';
import 'package:vouch/new_code/backend/models/all_notifications_model.dart';
import 'package:vouch/new_code/backend/models/feeds_model.dart';
import '../../backend/models/base_response.dart';
import '../../backend/repos/get_all_notifications_repo.dart';


class NotificationsController extends GetxController{
  final AllNotificationsRepo repository = AllNotificationsRepo();
  var isLoading = false.obs;
  Future<AllNotificationsModel> getTotalNotifications() async {
    isLoading(true);
    try {
      BaseResponse<AllNotificationsModel> apiResult =
      await repository.getAllNotifications();
      if (apiResult.status) {
        print('Api Result Notifications Controller: ${apiResult.message}');

        Future.delayed(const Duration(milliseconds: 300), () {
          isLoading(false);
        });
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error Notifications : $error");
      rethrow;
    } finally{
      Future.delayed(const Duration(milliseconds: 300), () {
        isLoading(false);
      });
    }
  }

  Future<void> allNotificationsSeen() async {
    try {
      BaseResponse<AllNotificationsModel> apiResult =
      await repository.allNotificationSeen();
      if (apiResult.status) {
        print('Api Result Notifications Seen Controller: ${apiResult.message}');
        Future.delayed(const Duration(milliseconds: 300), () {
        });
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error Notifications : $error");
      rethrow;
    } finally{

    }
  }

  Future<void> singleNotificationSeen(dynamic notificationId) async {
    try {
      BaseResponse<AllNotificationsModel> apiResult =
      await repository.singleNotificationSeen(notificationId);
      if (apiResult.status) {
        print('Api Result Notifications Seen Controller: ${apiResult.message}');
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error Notifications : $error");
      rethrow;
    } finally{

    }
  }
}