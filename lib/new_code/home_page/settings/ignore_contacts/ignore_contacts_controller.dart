import 'package:get/get.dart';
import 'package:vouch/new_code/backend/models/get_all_contacts_model.dart';
import '../../../backend/models/add_ignore_contacts_model.dart';
import '../../../backend/models/base_response.dart';
import '../../../backend/models/remove_ignored_contacts_model.dart';
import '../../../backend/repos/ignore_contacts_repo.dart';


class IgnoreContactsController extends GetxController {
  final IgnoreContactsRepository repository = IgnoreContactsRepository();
  var isLoading = false.obs;

  Future<GetAllContactsModel> getAllContacts() async {
    isLoading(true);
    try {
      BaseResponse<GetAllContactsModel> apiResult =
      await repository.getAllContacts();
      if (apiResult.status) {
        print('Api Result Get All Contacts Controller: ${apiResult.message}');
        isLoading(false);
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error Get All Contacts : $error");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future<AddIgnoreListModel> ignoreContacts(dynamic ignoreList ) async {
    var data = {
      "contactList" : ignoreList
    };
    isLoading(true);
    try {
      BaseResponse<AddIgnoreListModel> apiResult =
      await repository.ignoreContacts(data);
      if (apiResult.status) {
        print('Api Result Ignore Contacts Controller: ${apiResult.message}');
        isLoading(false);
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error ignore Contacts : $error");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future<RemoveIgnoreListModel> removeIgnoredContacts(dynamic removeIgnoreList ) async {
    var data = {
      "contactList" : removeIgnoreList
    };
    isLoading(true);
    try {
      BaseResponse<RemoveIgnoreListModel> apiResult =
      await repository.removeIgnoreContacts(data);
      if (apiResult.status) {
        print('Api Result Remove Ignore Contacts Controller: ${apiResult.message}');
        isLoading(false);
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error Remove ignore Contacts : $error");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

}