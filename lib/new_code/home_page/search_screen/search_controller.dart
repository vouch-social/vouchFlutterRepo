import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '/new_code/backend/models/search_recommendation_model.dart';
import '/new_code/backend/models/search_screen_response_model.dart';
import '/new_code/backend/repos/search_repo.dart';

import '../../backend/models/base_response.dart';
import '../../backend/repos/search_demo_message_repo.dart';

class SearchScreenController extends GetxController{

  final searchController = TextEditingController();

  final SearchRepository repository = SearchRepository();
  final GetSearchDemoRepo searchDemoRepo = GetSearchDemoRepo();

  var isSearchLoading = false.obs;
  var isSuggestionLoading = false.obs;
  var showSendIcon = false;
  Future<SearchScreenResponseModel> getSearchData(dynamic context) async {

    var data = {
      "context" : context
    };
    isSearchLoading(true);
    try {
      isSearchLoading(true);
      BaseResponse<SearchScreenResponseModel> apiResult =
      await repository.getSearch(data);
      if (apiResult.status) {
        print('Api Result Search : ${apiResult.message}');
        Future.delayed(const Duration(milliseconds: 200), () {
          isSearchLoading(false);
        });
        print("Search Length: ${apiResult.data.searchData.length}");
        if(apiResult.data != null && apiResult.data.searchData != null){
          return apiResult.data;
        }else{
          Future.delayed(const Duration(milliseconds: 200), () {
            isSearchLoading(false);
          });
          return SearchScreenResponseModel(searchData: []);
        }
      }
      return apiResult.data;
    } catch (error) {
      print("Error Search $error");
      isSearchLoading(false);
      return SearchScreenResponseModel(searchData: []);

    }finally{
      Future.delayed(const Duration(milliseconds: 100), () {
        isSearchLoading(false);
      });    }
  }

  Future<SearchBarRecommendationModel> getSearchDemoMessage() async {
    try {
      isSuggestionLoading(true);
      BaseResponse<SearchBarRecommendationModel> apiResult =
      await searchDemoRepo.getSearchSuggestionRepo();
      if (apiResult.status) {
        print('Api Result Search Suggestion: ${apiResult.message}');
        Future.delayed(const Duration(milliseconds: 300), () {
          isSuggestionLoading(false);
        });
        print("Search Length: ${apiResult.data.searchBarDemoMessages}");
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error Search Suggestion $error");
      rethrow;
    }finally{
      Future.delayed(const Duration(milliseconds: 300), () {
        isSuggestionLoading(false);
      });    }
  }


}