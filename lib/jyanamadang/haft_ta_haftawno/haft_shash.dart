import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HaftShash extends StatefulWidget {
  const HaftShash({super.key});

  @override
  State<HaftShash> createState() => _WanyakState();
}

class _WanyakState extends State<HaftShash> {
  late YoutubePlayerController _controller;
  bool _isFullScreen = false; // track fullscreen state

  @override
  void initState() {
    super.initState();

    const videoUrl = "https://youtu.be/vfUH67chp8Q?si=P_wUE0EsZMaV7rbw";
    final videoId = YoutubePlayer.convertUrlToId(videoUrl)!;

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: false,
        enableCaption: true,
        forceHD: true,
      ),
    );

    // Listen for fullscreen changes
    _controller.addListener(() {
      if (mounted) {
        setState(() {
          _isFullScreen = _controller.value.isFullScreen;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.purple,
          progressColors: const ProgressBarColors(
            playedColor: Colors.purple,
            handleColor: Colors.purpleAccent,
          ),
          onReady: () {
            debugPrint('🎬 YouTube Player is ready.');
          },
        ),
        builder: (context, player) {
          return Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  "ئەڵقەی حەفتا و شەش",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              backgroundColor: Colors.purple[200],
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 📜 Top text
                    if (!_isFullScreen)
                      const Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text(
                          "",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    // 🎥 Video Player Centered
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: player,
                    ),

                    if (!_isFullScreen) ...[
                      const SizedBox(height: 16),
                      const Text(
                        "🎥 کلیک بکە بۆ دەستپێکردنی ڤیدۆیەکە",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
