import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pak_endo/Controllers/api_controller.dart';
import 'package:pak_endo/views/widgets/loaders.dart';

class ProfileController extends GetxController{

  getProfile(String id) async {
    try {
      getLoader();
      // var res = ApiController().getProfile(id);

    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }


}