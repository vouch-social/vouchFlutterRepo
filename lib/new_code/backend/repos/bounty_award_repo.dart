import 'package:dio/dio.dart' as dio;
import '/new_code/backend/backend_constants.dart';
import '/new_code/backend/models/award_bounty_model.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../network/dio_client.dart';

class BountyAwardRepository {
  static final BountyAwardRepository _instance =
  BountyAwardRepository._internal();
  late final DioClient _dioClient;

  BountyAwardRepository._internal() {
    _dioClient = DioClient();
  }
  factory BountyAwardRepository() => _instance;

  Future<BaseResponse<AwardBountyModel>> awardHunter(dynamic bountyId,dynamic data) async {
    try {
      dio.Response response = await _dioClient.postRequest(
        endPoint: '/api/bounty/award/$bountyId',
        authToken: '${prefs!.getString(authToken)}',
        data: data,
      );
      print('DIO RES Award Bounty $response');
      if (response.data != null) {
        BaseResponse<AwardBountyModel> result =
        BaseResponse<AwardBountyModel>.fromJson(
          response.data,
          AwardBountyModel.fromJson,
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
