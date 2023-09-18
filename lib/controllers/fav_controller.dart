import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pak_endo/controllers/api_controller.dart';
import 'package:pak_endo/model/event_model.dart';
import 'package:pak_endo/views/widgets/loaders.dart';

class FavController extends GetxController {
  var fav = <EventModel>[].obs;
  var isFavourite = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    getFav();
  }

  getFav() async {
    try {
      getLoader();
      const int limit = 10;
      final int offset = fav.length;

      final result = await ApiController().getFavEvents(limit, offset);
      fav.addAll(
          (result['data'] as List).map((e) => EventModel.fromJson(e)).toList());

      isFavourite.addAll(fav.where((e) => e.isFavourite!).map((e) => e.id!));

      getDismiss();
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }

  addAndRemoveFavEvent(String id) async {
    try {
      getLoader();
      bool isAddToFav;
      if (isFavourite.contains(id)) {
        isFavourite.remove(id);
        isAddToFav = false;
      } else {
        isFavourite.add(id);
        isAddToFav = true;
      }
      await ApiController().addAndRemoveFavEvent(id, isAddToFav);
      getDismiss();
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }
}
