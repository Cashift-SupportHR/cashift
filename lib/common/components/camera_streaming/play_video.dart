// import 'dart:async';
//
// import 'package:last_pod_player/last_pod_player.dart';
//
// import '../../../presentationUser/common/stream_data_state.dart';
//
// class PlayVideo extends StatelessWidget {
//   final String url;
//   final StreamDataStateInitial<String>? streamNextVideoUrl;
//   final Function()? onTenSecondsRemaining;
//
//   PlayVideo({
//     super.key,
//     required this.url,
//     this.controller,
//     this.streamNextVideoUrl,
//     this.onTenSecondsRemaining,
//   });
//
//   PodPlayerController? controller;
//
//   @override
//   Widget build(BuildContext context) {
//     controller = PodPlayerController(
//       playVideoFrom: PlayVideoFrom.network(url),
//       podPlayerConfig: PodPlayerConfig(autoPlay: false),
//     )..initialise();
//     _listenToNextVideo();
//     controller?.changeVideo(
//       playVideoFrom: PlayVideoFrom.networkQualityUrls(
//         videoUrls: [VideoQalityUrls(url: url, quality: 750)],
//       ),
//     );
//     checkIfRemaingTexSeconds();
//     return Center(child: PodVideoPlayer(controller: controller!));
//   }
//   void _listenToNextVideo() {
//     if (streamNextVideoUrl != null) {
//       streamNextVideoUrl!.stream.listen((state) {
//         if (state.data != null && state.data!.isNotEmpty) {
//           String nextVideo = state.data!;
//           // allow 10-sec callback again if you swap back
//           controller?.changeVideo(
//             playVideoFrom: PlayVideoFrom.network(nextVideo),
//           );
//         }
//       });
//     }
//   }
//
//   void checkIfRemaingTexSeconds(){
//     // check if remaining 10 seconds calls onTenSecondsRemaining
//     controller!.addListener(() {
//       if (controller!.totalVideoLength.inSeconds - controller!.currentVideoPosition.inSeconds <= 10) {
//         if (onTenSecondsRemaining != null) {
//           onTenSecondsRemaining!();
//         }
//       }
//     });
//   }
// }
