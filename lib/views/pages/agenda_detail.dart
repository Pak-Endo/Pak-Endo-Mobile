import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/Constants/app_colors.dart';
import 'package:pak_endo/controllers/home_controller.dart';
import 'package:pak_endo/model/event_model.dart';
import 'package:pak_endo/routes/navigations.dart';

class AgendaDetail extends StatelessWidget {
  AgendaDetail(this.agenda, {super.key});

  final Agenda agenda;
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getImage(),
                  const Divider(),
                  getTile(
                      Icons.calendar_month,
                      homeController.getDay(agenda.day!),
                      '${agenda.from} - ${agenda.to}'),
                  getTile(Icons.topic_outlined, agenda.theme!, 'Theme'),
                  getTile(Icons.view_agenda, agenda.agendaTitle!, agenda.hall!),
                  const SizedBox(height: 10),
                  getSponsor(),
                  getSpeakerTeam()
                ])));
  }

  getAppBar() {
    return AppBar(
        leading: GestureDetector(
            onTap: () => navigatorKey.currentState!.pop(),
            child: const Icon(Icons.arrow_back)),
        title: const Text("Agenda Detail"),
        titleSpacing: 0.0,
        centerTitle: true,
        toolbarHeight: 73.2,
        toolbarOpacity: 0.8,
        shadowColor: Appcolors.appbluecolor.withOpacity(0.8),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
        elevation: 0.00,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue, Colors.green]))));
  }

  getImage() {
    if (agenda.speakerImg == null || agenda.speakerImg!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Center(
        child: Column(children: [
      Stack(children: [
        Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                    colors: [Appcolors.appgreencolor, Appcolors.appbluecolor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter))),
        Positioned(
            bottom: 2,
            left: 2,
            right: 2,
            top: 2,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                    tag: agenda.id!,
                    child: CachedNetworkImage(
                        imageUrl: agenda.speakerImg!,
                        height: 200.0,
                        width: 200,
                        fit: BoxFit.cover,
                        errorWidget: (_, url, err) => Image.asset(
                            "assets/profile.jpg",
                            fit: BoxFit.cover),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator.adaptive(
                                    backgroundColor: Appcolors.appgreencolor,
                                    value: downloadProgress.progress))))))
      ]),
      const SizedBox(height: 10),
      Center(
          child: Text(agenda.speaker!,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w400))),
          Center(
              child: Text(agenda.speakerDesignation??'',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w100)))
    ]));
  }

  getTile(IconData icon, String title, String subTitle) {
    return Column(children: [
      const SizedBox(height: 5),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Container(
                height: MediaQuery.of(Get.context!).size.height * 0.06,
                width: MediaQuery.of(Get.context!).size.height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.grey.withOpacity(0.5)),
                child: Icon(icon, color: Appcolors.Appbuttoncolor, size: 30)),
            Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(Get.context!).size.width * 0.05),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: Get.width * 0.64,
                          child: Text(title, style: const TextStyle(fontSize: 18))),
                      SizedBox(
                          height:
                              MediaQuery.of(Get.context!).size.width * 0.01),
                      Text(subTitle,
                          style: const TextStyle(
                              color: Colors.black26, fontSize: 14))
                    ]))
          ]))
    ]);
  }

  getSponsor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sponsored by',
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
        const Padding(
            padding: EdgeInsets.only(right: 250),
            child: Divider(color: Appcolors.appgreencolor, thickness: 2)),
        const SizedBox(height: 5),

        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(children: [
              ClipRRect(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(8.0)),
                  child: CachedNetworkImage(
                      imageUrl: agenda.sponsor?.sponsorLogo??'',
                      height: MediaQuery.of(Get.context!).size.height *
                          0.04,
                      width: MediaQuery.of(Get.context!).size.height *
                          0.04,
                      fit: BoxFit.cover,
                      errorWidget: (_, url, err) => Image.asset(
                          "assets/profile.jpg",
                          fit: BoxFit.cover),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator.adaptive(
                              backgroundColor:
                              Appcolors.appgreencolor,
                              value: downloadProgress.progress)))),
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(Get.context!).size.width * 0.05),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(agenda.sponsor!.sponsorName!, style: const TextStyle(fontSize: 18)),
                        SizedBox(
                            height: MediaQuery.of(Get.context!).size.width * 0.01),
                        const Text("Sponsor",
                            style: TextStyle(color: Colors.black38, fontSize: 14))
                      ]))
            ])),
      ],
    );
  }

  getSpeakerTeam() {
    if(agenda.speakerTeam!.isEmpty){
      return const SizedBox.shrink();
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 25),
      Text('Speaker\'s Team',
          style: Theme.of(Get.context!)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
      const Padding(
          padding: EdgeInsets.only(right: 230),
          child: Divider(color: Appcolors.appgreencolor, thickness: 2)),
      const SizedBox(height: 5),
      GridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.7, crossAxisCount: 2),
          children: agenda.speakerTeam!
              .map((e) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue.withOpacity(0.5),
                          Colors.green.withOpacity(0.5),
                        ],
                      )),
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.name!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    letterSpacing: 1.1,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700)),
                            Text(e.role!,
                                style: const TextStyle(
                                    fontSize: 11.0, color: Colors.black87))
                          ]))))
              .toList()),
    ]);
  }
}
