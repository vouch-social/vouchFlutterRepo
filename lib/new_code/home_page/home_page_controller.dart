import 'package:get/get.dart';
import 'package:vouch/new_code/home_page/paths_screen/paths_screen.dart';

import '../backend/models/base_response.dart';
import '../backend/models/paths_model.dart';
import '../backend/repos/paths_recommendations_repo.dart';

class HomeController extends GetxController{
  final PathsRepository repository = PathsRepository();

  Future<void> getPathsList() async {
    var data = {
      "searchedHashedPhone":
      "1287462312a906808001e076166750f8407124a3bdf51364102aeae6ec389138"
    };
    try {
      BaseResponse<PathsModel> apiResult =
      await repository.getPaths(data);
      if (apiResult.status) {
        print('Api Result : ${apiResult.message}');
        Get.to(() => PathsScreen(pathsModel: apiResult.data));
        //return apiResult.data;
      }
    } catch (error) {
      print("Error getPathLit: $error");
      rethrow;
    }
  }

}