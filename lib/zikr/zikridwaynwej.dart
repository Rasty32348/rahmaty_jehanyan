import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Zikridwaynwej extends StatefulWidget {
  const Zikridwaynwej({super.key});

  @override
  State<Zikridwaynwej> createState() => _ZikribayanayState();
}

class _ZikribayanayState extends State<Zikridwaynwej> {
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
      await _player.play(AssetSource("sounds/nwrj.mp3"));
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
              "زیکری دوای نوێژ",
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
                    "أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ\n\n"
                    "اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ "
                    "لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ "
                    "إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ "
                    "بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ "
                    "وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ."
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
                    "بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم\n\n"
                    "قُلْ هُوَ ٱللَّهُ أَحَدٌ، ٱللَّهُ ٱلصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُن لَّهُۥ كُفُوًا أَحَدٌۢ."
                    "\n"
                    "دوای نوێژی ئێوارە و بەیانی سێ جار (٣ جار)"
                    "\n"
                    "دوای نوێژەکانی تر یەک جار(١ جار)"
                    ,
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
                    "بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم\n\n"
                    "قُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّ ٱلنَّفَّٰثَٰتِ فِى ٱلْعُقَدِ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ."
                    "\n"
                      "دوای نوێژی ئێوارە و بەیانی سێ جار (٣ جار)"
                    "\n"
                    "دوای نوێژەکانی تر یەک جار(١ جار)"
                    ,
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
                    "بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم\n\n"
                    "قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ، مَلِكِ ٱلنَّاسِ، إِلَٰهِ ٱلنَّاسِ، مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ، "
                    "ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ، مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ."
                    "\n"
                      "دوای نوێژی ئێوارە و بەیانی سێ جار (٣ جار)"
                    "\n"
                    "دوای نوێژەکانی تر یەک جار(١ جار)"
                    ,
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
                    "اللَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ وَشُكْرِكَ وَحُسْنِ عِبَادَتِكَ. \n"
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
                    "اللَّهُمَّ أَجِرْنِي مِنْ النَّار.\n"
                   
                    "حەوت جار (٧ جار)",
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
                    "لا إلهَ إلاّ اللّهُ وحْـدَهُ لا شريكَ لهُ، لهُ المُلكُ ولهُ الحَمْد، يُحيـي وَيُمـيتُ وهُوَ على كُلّ شيءٍ قدير. \n"
                    "\n"
                    "دە جار (١٠ جار)",
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
                    "لا إلهَ إلاّ اللّهُ وَحْـدَهُ لا شريكَ لهُ، لهُ الملكُ ولهُ الحَمْد، وهُوَ على كُلّ شَيءٍ قَـدير.\n"
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
                    "أَسْـتَغْفِرُ الله، أَسْـتَغْفِرُ الله، أَسْـتَغْفِرُ الله.\n"
                    "اللّهُـمَّ أَنْـتَ السَّلامُ ، وَمِـنْكَ السَّلام ، تَبارَكْتَ يا ذا الجَـلالِ وَالإِكْـرام . "
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
                    "سُـبْحانَ اللهِ،\n"
                    "\n"
                    "سی و سێ جار (٣٣ جار)",
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
                    "والحَمْـدُ لله\n"
                    "\n"
                    "سی و سێ جار (٣٣ جار)",
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
                    "واللهُ أكْـبَر\n"
                    
                    "\n"
                    "سی و سێ جار (٣٣ جار)",
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
                    "لا إلهَ إلاّ اللّه, وحدَهُ لا شريكَ لهُ، لهُ الملكُ ولهُ الحَمد، وهوَ على كلّ شيءٍ قدير، لا حَـوْلَ وَلا\n"
                    "قـوَّةَ إِلاّ بِاللهِ، لا إلهَ إلاّ اللّـه، وَلا نَعْـبُـدُ إِلاّ إيّـاه, لَهُ النِّعْـمَةُ وَلَهُ الفَضْل وَلَهُ الثَّـناءُ الحَـسَن،"
                    "لا إلهَ إلاّ اللّهُ مخْلِصـينَ لَـهُ الدِّينَ وَلَوْ كَـرِهَ الكـافِرون."
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
                    "اللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا، وَرِزْقًا طَيِّبًا، وَعَمَلًا مُتَقَبَّلًا.\n"
                    
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
