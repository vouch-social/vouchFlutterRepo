import 'package:get/get.dart';
import '../../../backend/models/attribute_validation_response_model.dart';
import '../../../backend/models/attributes_validation_model.dart';
import '../../../backend/models/base_response.dart';
import '../../../backend/repos/attributes_validation_repo.dart';

class AttributesValidationController extends GetxController {
  final AttributesValidationRepo repository = AttributesValidationRepo();

  var isLoading = false.obs;

  Future<AttributesValidationModel> getAttributesValidationData() async {
    isLoading(true);
    try {
      BaseResponse<AttributesValidationModel> apiResult =
          await repository.getAttributesValidation();
      if (apiResult.status) {
        print('Api Result Attributes Validation : ${apiResult.message}');
        if (apiResult.data != null) {
          isLoading(false);
          return apiResult.data;
        }
      }
      return apiResult.data;
    } catch (error) {
      print("Error Attribute Get Validation $error");
      isLoading(false);
      rethrow;
    } finally {
        isLoading(false);
    }
  }

  Future<AttributesValidationResponseModel> postAttributesValidationData(dynamic id, dynamic upvote) async {

    var data = {
      "validationId": id,
      "upvote": upvote
    };
    try {
      BaseResponse<AttributesValidationResponseModel> apiResult =
      await repository.postAttributesValidation(data);
      if (apiResult.status) {
        print('Api Result Get Attributes Validation : ${apiResult.message}');
        if (apiResult.data != null) {
          return apiResult.data;
        }
      }
      return apiResult.data;
    } catch (error) {
      print("Error Validation $error");
      rethrow;
    } finally {
    }
  }

}
