import 'package:get/get.dart';
import 'package:vouch/new_code/home_page/paths_screen/path_success_screen.dart';

import '../../backend/models/base_response.dart';
import '../../backend/models/paths_model.dart';
import '../../backend/repos/paths_recommendations_repo.dart';

class PathsController extends GetxController {


  final PathsRepository repository = PathsRepository();

  Future<void> sendPath(
      {dynamic pathList, dynamic length, dynamic strength}) async {
    var data = {
      "pathData": {
        "path": "$pathList",
        "length": "$length",
        "strength": "$strength"
      },
      "context": "Want to Connect With Nirant Ramakuru"
    };
    try {
      BaseResponse<AllPaths> apiResult =
      await repository.sendSelectedPath(data);
      if (apiResult.status) {
        print('Api Result Send Selected Path : ${apiResult.message}');
        Get.to(() => const PathSuccessScreen());
      }
    } catch (error) {
      print("Error getPathLit: $error");
      rethrow;
    }
  }

}
