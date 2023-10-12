import 'package:flutter/material.dart';
import 'package:pak_endo/routes/navigations.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../constants/app_colors.dart';

class YouTubePlayerPage extends StatefulWidget {
  final String videoUrl;

  const YouTubePlayerPage({super.key, required this.videoUrl});

  @override
  State<YouTubePlayerPage> createState() => _YouTubePlayerPageState();
}

class _YouTubePlayerPageState extends State<YouTubePlayerPage> {
  late YoutubePlayerController _controller;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl).toString(),
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(_listener);
  }

  void _listener() {
    if (_controller.value.isFullScreen != _isFullScreen) {
      setState(() {
        _isFullScreen = _controller.value.isFullScreen;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _isFullScreen
            ? null
            : AppBar(
                leading: GestureDetector(
                    onTap: () => navigatorKey.currentState!.pop(),
                    child: const Icon(Icons.arrow_back)),
                title: const Text("Watch Live"),
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
                            colors: [Colors.blue, Colors.green])))),
        body: Center(
            child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                onReady: () {
                })));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// import 'package:flutter/cupertino.dart';
//
// class YouTubePlayerPage extends StatefulWidget {
//   final String videoUrl;
//
//   const YouTubePlayerPage({super.key, required this.videoUrl});
//
//   @override
//   State<YouTubePlayerPage> createState() => _YouTubePlayerPageState();
// }
//
// class _YouTubePlayerPageState extends State<YouTubePlayerPage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
