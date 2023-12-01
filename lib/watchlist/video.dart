// import 'package:flutter/material.dart';
// import 'package:movieapp/provider/firebase_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:video_player/video_player.dart';
//
// class Video extends StatefulWidget {
//   final String videoUrl;
//
//   const Video({Key? key, required this.videoUrl}) : super(key: key);
//
//   @override
//   State<Video> createState() => _VideoState();
// }
//
// class _VideoState extends State<Video> {
//   late VideoPlayerController _controller;
//
//   @override
//   @override
//   Widget build(BuildContext context) {
//     final videoProvider = Provider.of<FirebaseProvider>(context);
//
//     return Scaffold(
//       body: Center(
//         child: FutureBuilder(
//           future: videoProvider.initializeController(widget.videoUrl),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return _controller.value.isInitialized
//                   ? AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: VideoPlayer(_controller),
//               )
//                   : const CircularProgressIndicator();
//             } else {
//               return const CircularProgressIndicator();
//             }
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Play or pause the video
//           if (_controller.value.isPlaying) {
//             _controller.pause();
//           } else {
//             _controller.play();
//           }
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
//
//   );
//   }
// }
