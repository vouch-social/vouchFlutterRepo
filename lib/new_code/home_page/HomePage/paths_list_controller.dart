import 'package:get/get.dart';
import '../../backend/models/base_response.dart';
import '../../backend/models/paths_model.dart';
import '../../backend/repos/paths_recommendations_repo.dart';

class HomeController extends GetxController{
  final PathsRepository repository = PathsRepository();
  var isLoading = false.obs;

  Future<AllPaths> getPathsList(dynamic hashedPhone) async {
    isLoading(true);
    var data = {
      "searchedHashedPhone":
      hashedPhone
    };
    try {
      BaseResponse<AllPaths> apiResult =
      await repository.getPaths(data);
      if (apiResult.status) {
        print('Api Result : ${apiResult.message}');
        isLoading(false);
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error getPathLit: $error");
      rethrow;
    }finally{
      isLoading(false);
    }
  }


}