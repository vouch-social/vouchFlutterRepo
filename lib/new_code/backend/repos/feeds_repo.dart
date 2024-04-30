import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/feeds_model.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../models/my_vouch_history_model.dart';
import '../network/dio_client.dart';

class HomePageFeedsRepository {
  static final HomePageFeedsRepository _instance = HomePageFeedsRepository._internal();
  late final DioClient _dioClient;

  HomePageFeedsRepository._internal() {
    _dioClient = DioClient();
  }
  factory HomePageFeedsRepository() => _instance;

  Future<BaseResponse<FeedsModel>> getFeeds() async {
    try {
      dio.Response response = await _dioClient.getRequest(
        endPoint: '/api/dashboard/feeds',
        bearerToken: '${prefs!.getString(authToken)}',
        data: null,
      );
      print('DIO RES Feeds Response $response');
      if (response.data != null) {
        BaseResponse<FeedsModel> result =
        BaseResponse<FeedsModel>.fromJson(
          response.data,
          FeedsModel.fromJson,
        );
        print("Result Home Feeds: $result");
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
