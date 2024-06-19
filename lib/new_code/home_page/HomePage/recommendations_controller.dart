import 'package:get/get.dart';
import 'package:vouch/new_code/backend/models/recommendations_model.dart';
import '../../backend/models/base_response.dart';
import '../../backend/models/new_recommendations_model.dart';
import '../../backend/repos/recommendations_repo.dart';

class RecommendationsController extends GetxController {
  final RecommendationsRepo repository = RecommendationsRepo();
  var isLoading = false.obs;

  Future<NewRecommendationsModel> getRecommendationsData() async {
    try {
      isLoading(true);
      BaseResponse<GetRecommendationsModel> apiResult =
      await repository.getRecommendations();
      if (apiResult.status) {
        print('Api Result Recommendations : ${apiResult.message}');
        Future.delayed(const Duration(milliseconds: 300), () {
          isLoading(false);
        });
        // return apiResult.data;
        print("${transformRecommendationsData(apiResult.data)}");
        return transformRecommendationsData(apiResult.data);
      }
      // return apiResult.data;
      return transformRecommendationsData(apiResult.data);
    } catch (error) {
      print("Error Recommendations: $error");
      rethrow;
    } finally {
      Future.delayed(const Duration(milliseconds: 300), () {
        isLoading(false);
      });
    }
  }

  NewRecommendationsModel transformRecommendationsData(
      GetRecommendationsModel oldModel) {
    List<NewUserDatum> newUserDataList = [];
    for (var recommendationDatum in oldModel.recommendationData) {
      List<NewUserDatum> newUserData = recommendationDatum.userData.map((
          oldUserDatum) {
        return NewUserDatum(
          createdAt: oldUserDatum.createdAt,
          updatedAt: oldUserDatum.updatedAt,
          id: oldUserDatum.id,
          userDatumCreatedAt: oldUserDatum.userDatumCreatedAt,
          name: oldUserDatum.name,
          phone: oldUserDatum.phone,
          firebaseid: oldUserDatum.firebaseid,
          photourl: oldUserDatum.photourl,
          graphid: oldUserDatum.graphid,
          hashedphone: oldUserDatum.hashedphone,
          linkedinsub: oldUserDatum.linkedinsub,
          email: oldUserDatum.email,
          reason: oldUserDatum.reason,
          vanityname: oldUserDatum.vanityname,
          localizedheadline: oldUserDatum.localizedheadline,
          contactsSync: oldUserDatum.contactsSync,
          callLogsSync: oldUserDatum.callLogsSync,
          linkedinSync: oldUserDatum.linkedinSync,
          countryCode: oldUserDatum.countryCode,
          deletedAt: oldUserDatum.deletedAt,
          goal: recommendationDatum.goal,
          attributes: [], // Assign the goal from RecommendationDatum
          // attributes: oldUserDatum.attributes.map((e) => ),
        );
      }).toList();

      //   return RecommendationDatum(
      //     userData: newUserData,
      //   );
      // }).toList();
      //
      newUserDataList.addAll(newUserData);
    }
    return NewRecommendationsModel(
      userData: newUserDataList,
    );
  }
}
