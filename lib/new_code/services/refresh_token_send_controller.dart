import 'package:get/get.dart';
import '../../../auth/checkAuth.dart';
import '../../auth/firebase_auth/auth_util.dart';
import '../backend/repos/save_attributes_goals_repo.dart';

class FcmTokenController extends GetxController {
  final AttributesGoalsRepo repository = AttributesGoalsRepo();
  var isLoading = false.obs;

  Future<void> saveUserController(dynamic token,) async {
    try {
      var data = {
        "fcm": token,
        'firebaseid': currentUserReference?.id
      };
      print("DATA : $data");

      final response = await repository.saveUser(data);

      if (response.status) {
        await checkUser();
      } else {
        print('Status is false');
      }
    } catch (error) {
      print('Token Resend: $error');
    }
  }
}