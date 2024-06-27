import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/all_notifications_model.dart';
import 'package:vouch/new_code/backend/models/getWalletModel.dart';
import 'package:vouch/new_code/backend/models/wallet_transactions_model.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../network/dio_client.dart';



class GetWalletRepo {
  static final GetWalletRepo _instance = GetWalletRepo._internal();
  late final DioClient _dioClient;

  GetWalletRepo._internal() {
    _dioClient = DioClient();
  }
  factory GetWalletRepo() => _instance;

  Future<BaseResponse<GetWalletModel>> getWallet() async {
    try {
      dio.Response response = await _dioClient.getRequest(
        endPoint: '/api/wallet',
        bearerToken: '${prefs!.getString(authToken)}',
        data: null,
      );
      print('DIO RES Get Wallet Model $response');
      if (response.data != null) {
        BaseResponse<GetWalletModel> result =
        BaseResponse<GetWalletModel>.fromJson(
          response.data,
          GetWalletModel.fromJson,
        );
        print("Result Get Wallet Repo: $result");
        return result;
      } else {
        throw Exception('Response data is null');
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  Future<BaseResponse<WalletTransactionsModel>> allTransactions() async {
    try {
      dio.Response response = await _dioClient.postRequest(
        endPoint: '/api/wallet/transactions',
        authToken: '${prefs!.getString(authToken)}',
        data: null,
      );
      print('DIO RES Transactions Model $response');
      if (response.data != null) {
        BaseResponse<WalletTransactionsModel> result =
        BaseResponse<WalletTransactionsModel>.fromJson(
          response.data,
          WalletTransactionsModel.fromJson,
        );
        print("Result Wallet Transactions: $result");
        return result;
      } else {
        throw Exception('Response data is null');
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  Future<BaseResponse<AllNotificationsModel>> singleNotificationSeen(dynamic notificationId) async {
    try {
      dio.Response response = await _dioClient.postRequest(
        endPoint: '/api/notifications/seen/$notificationId',
        authToken: '${prefs!.getString(authToken)}',
        data: null,
      );
      print('DIO RES Notifications Model $response');
      if (response.data != null) {
        BaseResponse<AllNotificationsModel> result =
        BaseResponse<AllNotificationsModel>.fromJson(
          response.data,
          AllNotificationsModel.fromJson,
        );
        print("Result Notifications: $result");
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
