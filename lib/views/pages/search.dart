import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/routes/navigations.dart';
import 'package:pak_endo/views/widgets/CustomWidgets/custom_view.dart';
import 'package:pak_endo/views/widgets/custom_chips.dart';
import 'package:pak_endo/views/widgets/filter_sheet.dart';
import 'package:pak_endo/views/widgets/search_result.dart';

import '../../controllers/search_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final SearchPageController controller = Get.put(SearchPageController());

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  _submitSearch() {
    if (_searchController.text.isNotEmpty) {
      controller.getSearchedEvents(false, title: _searchController.text.trim());
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
            scrollInfo is ScrollEndNotification) {
          controller.getSearchedEvents(true,
              title: _searchController.text.trim());
          return true;
        } else {
          return false;
        }
      },
      child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.018),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => navigatorKey.currentState!.pop()),
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  controller: _searchController,
                                  onFieldSubmitted: (_) => _submitSearch(),
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Search events here...')))),
                      Obx(() {
                        return Visibility(
                            visible: controller.searchResult.isNotEmpty,
                            child: TextButton(
                              onPressed: () {
                                _searchController.clear();
                                controller.searchResult.clear();
                              },
                              child: const Text('CLEAR'),
                            ));
                      }),
                      IconButton(
                          onPressed: showFilters, icon: const Icon(Icons.tune)),
                      IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: _submitSearch)
                    ])),

            /// SHOW FILTERS
            getFilters(),

            Obx(() =>
            controller.searchResult.isEmpty
                ? const Expanded(
                    child: Center(
                        child: CustomView(
                            'No Search Query Found', Icons.search_off)))
                : Expanded(
                    child: Container(
                        color: Colors.grey[200],
                        child: Center(child: SearchResult()))))
          ])),
    );
  }

  showFilters() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0))),
        builder: (BuildContext context) => const FilterSheetContent());
  }

  getFilters() {
    return Obx(() => controller.filterChips.isEmpty
        ? const SizedBox.shrink()
        : Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('Filters:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)))),
                Wrap(
                    runSpacing: 1.2,
                    spacing: 10,
                    children: controller.filterChips
                        .map((element) => CustomChip(label: element))
                        .toList()),
              ],
            ),
          ));
  }
}
