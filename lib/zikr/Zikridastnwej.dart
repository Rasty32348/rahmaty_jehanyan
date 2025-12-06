import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Zikridastnwej extends StatefulWidget {
  const Zikridastnwej({super.key});

  @override
  State<Zikridastnwej> createState() => _ZikribayanayState();
}

class _ZikribayanayState extends State<Zikridastnwej> {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;

  Duration _duration = Duration.zero; // total duration
  Duration _position = Duration.zero; // current position

  @override
  void initState() {
    super.initState();

    // Listen for duration and position changes
    _player.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });

    _player.onPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });

    _player.onPlayerComplete.listen((event) {
      setState(() {
        _isPlaying = false;
        _position = Duration.zero;
      });
    });
  }

  Future<void> _toggleSound() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.play(AssetSource("sounds/dastnwhj.mp3"));
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  Future<void> _seekTo(Duration position) async {
    await _player.seek(position);
  }

  Future<void> _rewind10s() async {
    final newPosition = _position - const Duration(seconds: 10);
    await _seekTo(newPosition >= Duration.zero ? newPosition : Duration.zero);
  }

  Future<void> _forward10s() async {
    final newPosition = _position + const Duration(seconds: 10);
    await _seekTo(newPosition <= _duration ? newPosition : _duration);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "زیکری دەستنوێژ",
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.purple[200],
        ),
       body: Padding(
  padding: const EdgeInsets.all(16),
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Progress bar
        Slider(
          min: 0,
          max: _duration.inSeconds.toDouble(),
          value: _position.inSeconds
              .toDouble()
              .clamp(0, _duration.inSeconds.toDouble()),
          onChanged: (value) {
            _seekTo(Duration(seconds: value.toInt()));
          },
        ),

        // Time indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_formatTime(_position)),
            Text(_formatTime(_duration)),
          ],
        ),

        const SizedBox(height: 20),

        // Controls row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.forward_10, size: 32),
              onPressed: _rewind10s,
            ),
            IconButton(
              icon: Icon(
                _isPlaying
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_filled,
                size: 48,
                color: Colors.purple[300],
              ),
              onPressed: _toggleSound,
            ),
            IconButton(
              icon: const Icon(Icons.replay_10, size: 32),
              onPressed: _forward10s,
            ),
          ],
        ),
              const SizedBox(height: 16),

               Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: const Text(
                    "زیکری پێش دەستنوێژ\n"
                    "بِسْمِ ٱللّٰهِ"
                    "\n"
                    "یەک جار (١ جار)",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18, height: 1.6),
                  ),
                ),
              ),
              const SizedBox(height: 8),

               Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: const Text(
                    "زیکری دوای دەستنوێژ\n"
                    "أشْهَدُ أن لا إله إلا الله وحْدَهُ لا شريكَ لهُ ، وأشْهَدُ أنَّ محمداً عَبدُهُ ورسُولُه"
                    "اللَّهُمَّ اجْعَلْني مِنَ التَّوَّابينَ واجْعَلْنِي من المُتَطَهِّرِينَ"
                    "سُبْحَانَكَ اللَّهُمَّ وبَحَمْدكَ أشْهدُ أنْ لا إلهَ إلا أنْتَ أَسْتَغْفِرُكَ وأتُوبُ إِلَيْكَ"
                    "\n"
                    "یەک جار (١ جار)",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18, height: 1.6),
                  ),
                ),
              ),
              const SizedBox(height: 8),



            ],
          ),
        ),
      ),
      ),
    );
  }
}
