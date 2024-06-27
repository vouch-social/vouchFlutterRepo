import 'package:get/get.dart';
import 'package:vouch/new_code/backend/models/getWalletModel.dart';
import 'package:vouch/new_code/backend/models/wallet_transactions_model.dart';
import '../../../backend/models/base_response.dart';
import '../../../backend/repos/get_wallet_repo.dart';



class WalletController extends GetxController{
  final GetWalletRepo repository = GetWalletRepo();
  var isLoading = false.obs;
  Future<GetWalletModel> getWalletController() async {
    isLoading(true);
    try {
      BaseResponse<GetWalletModel> apiResult =
      await repository.getWallet();
      if (apiResult.status) {
        print('Api Result Get Wallet Controller: ${apiResult.message}');
        Future.delayed(const Duration(milliseconds: 300), () {
          isLoading(false);
        });
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error Wallet Controller: $error");
      rethrow;
    } finally{
      Future.delayed(const Duration(milliseconds: 300), () {
        isLoading(false);
      });
    }
  }
  Future<GetWalletModel> getTransactions() async {
    isLoading(true);
    try {
      BaseResponse<WalletTransactionsModel> apiResult =
      await repository.allTransactions();
      if (apiResult.status) {
        print('Api Result Get Transactions Controller: ${apiResult.message}');
        Future.delayed(const Duration(milliseconds: 300), () {
          isLoading(false);
        });
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error Wallet Transaction Controller: $error");
      rethrow;
    } finally{
      Future.delayed(const Duration(milliseconds: 300), () {
        isLoading(false);
      });
    }
  }

}