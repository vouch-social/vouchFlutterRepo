import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vouch/new_code/backend/models/bounty_update_resonse_model.dart';
import 'package:vouch/new_code/backend/models/start_hunt_response_model.dart';
import 'package:vouch/new_code/backend/models/update_vouch_response_model.dart';
import 'package:vouch/new_code/backend/models/vouch_connect_response_model.dart';
import 'package:vouch/new_code/backend/repos/start_hunt_repo.dart';
import '../../../backend/models/base_response.dart';
import '../../../backend/repos/bounty_update_repo.dart';
import '../../../backend/repos/update_vouch_status_repo.dart';
import '../../../backend/repos/vouch_connect_repo.dart';


class VouchConnectController extends GetxController {
  final VouchConnectRepository repository = VouchConnectRepository();
  var isLoading = false.obs;

  Future<void> connectVouchUser(dynamic vouchId) async {
    isLoading(true);
    try {
      BaseResponse<VouchConnectModel> apiResult =
      await repository.connectVouch(vouchId);
      if (apiResult.status) {
        print('Api Result Vouch Connect Controller: ${apiResult.message}');
        if (apiResult.data != null && apiResult.data.urlForWhatsapp != null) {
          _launchURL(apiResult.data.urlForWhatsapp);
        }
        isLoading(false);
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error Vouch Connect  : $error");
      rethrow;
    } finally {
      isLoading(false);
    }
  }
  void _launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

}