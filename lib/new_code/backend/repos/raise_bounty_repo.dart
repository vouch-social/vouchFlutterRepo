import 'package:dio/dio.dart' as dio;
import '/new_code/backend/backend_constants.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../models/bounty_tags_model.dart';
import '../models/raise_bounty_model.dart';
import '../network/dio_client.dart';

class RaiseBountyRepository {
  static final RaiseBountyRepository _instance =
      RaiseBountyRepository._internal();
  late final DioClient _dioClient;

  RaiseBountyRepository._internal() {
    _dioClient = DioClient();
  }
  factory RaiseBountyRepository() => _instance;

  Future<BaseResponse<RaiseBountyResponseModel>> raiseBounty(
      dynamic data) async {
    try {
      print("Data $data");
      dio.Response response = await _dioClient.postRequest(
        endPoint: '/api/bounty/save',
        data: data,
        authToken: '${prefs!.getString(authToken)}',
      );
      print('DIO RES Raise Bounty $response');
      if (response.data != null) {
        BaseResponse<RaiseBountyResponseModel> result =
            BaseResponse<RaiseBountyResponseModel>.fromJson(
          response.data,
          RaiseBountyResponseModel.fromJson,
        );
        return result;
      } else {
        throw Exception('Response data is null');
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }


  Future<BaseResponse<BountyTagsModel>> bountyTags() async {
    try {
      dio.Response response = await _dioClient.getRequest(
        endPoint: '/api/bounty/getBountyTagsAll',
        data: null,
        bearerToken: '${prefs!.getString(authToken)}',
      );
      print('DIO RES Tags Bounty $response');
      if (response.data != null) {
        BaseResponse<BountyTagsModel> result =
        BaseResponse<BountyTagsModel>.fromJson(
          response.data,
          BountyTagsModel.fromJson,
        );
        return result;
      } else {
        throw Exception('Response data is null');
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }


}
