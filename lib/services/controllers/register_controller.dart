import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myapp/models/user_model.dart';
import 'package:myapp/repositories/user_respository.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  //TextField Controllers
  final email = TextEditingController();
  final password = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }
}