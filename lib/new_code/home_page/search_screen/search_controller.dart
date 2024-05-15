import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vouch/new_code/backend/models/search_screen_response_model.dart';
import 'package:vouch/new_code/backend/repos/search_repo.dart';

import '../../backend/models/base_response.dart';

class SearchScreenController extends GetxController{

  final searchController = TextEditingController();

  final SearchRepository repository = SearchRepository();

  var isLoading = false.obs;

  Future<SearchScreenResponseModel> getSearchData(dynamic context) async {

    var data = {
      "context" : context
    };
    try {
      isLoading(true);
      BaseResponse<SearchScreenResponseModel> apiResult =
      await repository.getSearch(data);
      if (apiResult.status) {
        print('Api Result Search : ${apiResult.message}');
        Future.delayed(const Duration(milliseconds: 300), () {
          isLoading(false);
        });
        print("Search Length: ${apiResult.data.searchData.length}");
        return apiResult.data;

      }
      return apiResult.data;
    } catch (error) {
      print("Error Search $error");
      rethrow;
    }finally{
      Future.delayed(const Duration(milliseconds: 300), () {
        isLoading(false);
      });    }
  }
}