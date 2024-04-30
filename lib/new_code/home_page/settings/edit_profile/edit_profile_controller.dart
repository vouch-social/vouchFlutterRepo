import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vouch/new_code/home_page/settings/edit_profile/edit_tags_screen.dart';

class EditProfileController extends GetxController{
  final nameController = TextEditingController();
  final imageController = TextEditingController();
  RxList<Tags> tagsController = <Tags>[].obs;
  final headlineController = TextEditingController();
}