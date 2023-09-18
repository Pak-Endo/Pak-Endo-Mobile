import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/controllers/fav_controller.dart';
import 'package:pak_endo/views/widgets/CustomWidgets/custom_view.dart';
import 'package:pak_endo/views/widgets/custom_text/app_large_text.dart';
import 'package:pak_endo/views/widgets/event_list_card.dart';

class FavoriteView extends StatelessWidget {
  FavoriteView({super.key});

  final FavController controller = Get.put(FavController());

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
            scrollInfo is ScrollEndNotification) {
          controller.getFav();
          return true;
        } else {
          return false;
        }
      },
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [appBar(), displayFav()]),
    );
  }

  appBar() {
    return Column(children: [
      SizedBox(height: MediaQuery.of(Get.context!).size.height * 0.05),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: AppLargeText(text: "Favourite Events", color: Colors.black),
      ),
    ]);
  }

  displayFav() {
    if (controller.fav.isEmpty) {
      return const Expanded(
          child:
              CustomView('You have not yet added Favorites', Icons.favorite));
    }
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: controller.fav.length,
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 120),
            shrinkWrap: true,
            itemBuilder: (_, index) {
              final event = controller.fav[index];
              return EventListCard(event);
            });
      }),
    );
  }
}
