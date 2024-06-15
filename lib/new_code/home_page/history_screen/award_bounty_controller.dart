import 'package:get/get.dart';
import '/new_code/backend/models/award_bounty_model.dart';
import '/new_code/backend/models/my_bounty_history_model.dart';
import '/new_code/backend/repos/bounty_award_repo.dart';
import '/new_code/backend/repos/my_bounty_history_repo.dart';

import '../../backend/models/base_response.dart';
import '../../backend/models/get_bounty_by_id_model.dart';
import '../../backend/repos/get_bounty_by_id_repo.dart';


class AwardBountyController extends GetxController {
  var isLoading = false.obs;
  var isDetailsLoading = false.obs;
  final BountyAwardRepository repository = BountyAwardRepository();



  Future<AwardBountyModel> awardTheHunter(dynamic bountyId,dynamic huntsId) async {

    var data = {
      "hunters" : huntsId
    };
    print("Award Data $data");
    isDetailsLoading(true);
    try {
      BaseResponse<AwardBountyModel> apiResult =
      await repository.awardHunter(bountyId,data);
      if (apiResult.status) {
        print('Api Result award hunter: ${apiResult.message}');

        return apiResult.data;
      }
      Future.delayed(Duration(milliseconds: 300), () {
        isDetailsLoading(false);
      });
      return apiResult.data;
    } catch (error) {
      print("Error Bounty Award: $error");
      rethrow;
    } finally {
      Future.delayed(Duration(milliseconds: 300), () {
        isDetailsLoading(false);
      });
    }
  }

}
