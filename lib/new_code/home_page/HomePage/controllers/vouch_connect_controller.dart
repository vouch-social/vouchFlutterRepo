import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '/new_code/backend/models/bounty_update_resonse_model.dart';
import '/new_code/backend/models/start_hunt_response_model.dart';
import '/new_code/backend/models/update_vouch_response_model.dart';
import '/new_code/backend/models/vouch_connect_response_model.dart';
import '/new_code/backend/repos/start_hunt_repo.dart';
import '../../../backend/models/base_response.dart';
import '../../../backend/repos/bounty_update_repo.dart';
import '../../../backend/repos/update_vouch_status_repo.dart';
import '../../../backend/repos/vouch_connect_repo.dart';
import '../new_home_page.dart';

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
          String url = apiResult.data.urlForWhatsapp.toString();
          print('Attempting to launch URL: $url');
          await _launchURL(url);
          Get.off(() => NewHomePage());
        }
        isLoading(false);
        return apiResult.data;
      } else {
        print('API result status was false.');
      }
    } catch (error) {
      print("Error Vouch Connect: $error");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future<void> _launchURL(String url) async {
    Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
