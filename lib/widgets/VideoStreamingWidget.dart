// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';


// class YouTubePlayerPage extends StatefulWidget {
//   final String videoUrl;

//   YouTubePlayerPage({required this.videoUrl});

//   @override
//   _YouTubePlayerPageState createState() => _YouTubePlayerPageState();
// }

// class _YouTubePlayerPageState extends State<YouTubePlayerPage> {
//   late YoutubePlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl).toString(),
//       flags: YoutubePlayerFlags(
//         autoPlay: true,
//         mute: false,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('YouTube Video Player'),
//       ),
//       body: Center(
//         child: YoutubePlayer(
//           controller: _controller,
//           showVideoProgressIndicator: true,
//           onReady: () {
//             // You can use the onReady callback to perform actions when the video is ready to play.
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }



// // class VideoStreamingPage extends StatefulWidget {
// //   @override
// //   _VideoStreamingPageState createState() => _VideoStreamingPageState();
// // }

// // class _VideoStreamingPageState extends State<VideoStreamingPage> {
// //   late VideoPlayerController _controller;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = VideoPlayerController.networkUrl(
// //       Uri.parse('https://www.youtube.com/watch?v=ceMsPBbcEGg'),
// //     )..initialize().then((_) {
// //         // Ensure the first frame is shown.
// //         setState(() {});
// //       });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Video Streaming Page'),
// //       ),
// //       body: Center(
// //         child: _controller.value.isInitialized
// //             ? AspectRatio(
// //                 aspectRatio: _controller.value.aspectRatio,
// //                 child: VideoPlayer(_controller),
// //               )
// //             : CircularProgressIndicator(), // Show loading indicator until video is initialized
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           setState(() {
// //             if (_controller.value.isPlaying) {
// //               _controller.pause();
// //             } else {
// //               _controller.play();
// //             }
// //           });
// //         },
// //         child: Icon(
// //           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }
// // }