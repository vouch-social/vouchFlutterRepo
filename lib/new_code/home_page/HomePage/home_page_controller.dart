import 'package:get/get.dart';
import 'package:vouch/new_code/home_page/paths_screen/paths_screen.dart';

import '../../backend/models/base_response.dart';
import '../../backend/models/paths_model.dart';
import '../../backend/repos/paths_recommendations_repo.dart';

class HomeController extends GetxController{
  final PathsRepository repository = PathsRepository();

  Future<AllPaths> getPathsList(dynamic hashedPhone) async {
    var data = {
      "searchedHashedPhone":
      hashedPhone
    };
    try {
      BaseResponse<AllPaths> apiResult =
      await repository.getPaths(data);
      if (apiResult.status) {
        print('Api Result : ${apiResult.message}');
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error getPathLit: $error");
      rethrow;
    }
  }


}