import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Zikrixawten extends StatefulWidget {
  const Zikrixawten({super.key});

  @override
  State<Zikrixawten> createState() => _ZikribayanayState();
}

class _ZikribayanayState extends State<Zikrixawten> {
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
      await _player.play(AssetSource("sounds/xawten.mp3"));
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
              "زیکری خەوتن",
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
                    "سێ جار (٣ جار)",
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
                    "سێ جار (٣ جار)",
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
                    "سێ جار (٣ جار)",
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
                    "أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ\n\n"
                    "آمَنَ الرَّسُولُ بِمَا أُنْزِلَ إِلَيْهِ مِنْ رَبِّهِ وَالْمُؤْمِنُونَ ۚ كُلٌّ آمَنَ بِاللَّهِ وَمَلَائِكَتِهِ وَكُتُبِهِ وَرُسُلِهِ لَا"
                    "نُفَرِّقُ بَيْنَ أَحَدٍ مِنْ رُسُلِهِ ۚ وَقَالُوا سَمِعْنَا وَأَطَعْنَا ۖ غُفْرَانَكَ رَبَّنَا وَإِلَيْكَ الْمَصِيرُ. لَا يُكَلِّفُ اللَّهُ"
                    "نَفْسًا إِلَّا وُسْعَهَا لَهَا مَا كَسَبَتْ وَعَلَيْهَا مَا اكْتَسَبَتْ رَبَّنَا لَا تُؤَاخِذْنَا إِنْ نَسِينَا أَوْ أَخْطَأْنَا رَبَّنَا"
                    "وَلَا تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِنْ قَبْلِنَا رَبَّنَا وَلَا تُحَمِّلْنَا مَا لَا طَاقَةَ لَنَا بِهِ وَاعْفُ"
                    "عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَا أَنْتَ مَوْلَانَا فَانْصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ."
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
                    "بِاسْمِكَ رَبِّـي وَضَعْـتُ جَنْـبي ، وَبِكَ أَرْفَعُـه، فَإِن أَمْسَـكْتَ نَفْسـي فارْحَـمْها ، وَإِنْ\n"
                    "أَرْسَلْتَـها فاحْفَظْـها بِمـا تَحْفَـظُ بِه عِبـادَكَ الصّـالِحـين."
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
                    "اللّهُـمَّ إِنَّـكَ خَلَـقْتَ نَفْسـي وَأَنْـتَ تَوَفّـاهـا لَكَ ممَـاتـها وَمَحْـياها ، إِنْ أَحْيَيْـتَها فاحْفَظْـها\n"
                   "، وَإِنْ أَمَتَّـها فَاغْفِـرْ لَـها . اللّهُـمَّ إِنَّـي أَسْـأَلُـكَ العـافِـيَة. "
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
                    "اللّهُـمَّ قِنـي عَذابَـكَ يَـوْمَ تَبْـعَثُ عِبـادَك.\n"
                    "\n"
                    "سێ جار (٣ جار)",
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
                    "بِاسْـمِكَ اللّهُـمَّ أَمـوتُ وَأَحْـيا.\n"
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
                    "الـحَمْدُ للهِ الَّذي أَطْـعَمَنا وَسَقـانا، وَكَفـانا، وَآوانا، فَكَـمْ مِمَّـنْ لا كـافِيَ لَـهُ وَلا مُـؤْوي.\n"
                    
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
                    "اللّهُـمَّ عالِـمَ الغَـيبِ وَالشّـهادةِ فاطِـرَ السّماواتِ وَالأرْضِ رَبَّ كُـلِّ شَـيءٍ وَمَليـكَه، أَشْهـدُ\n"
                    "أَنْ لا إِلـهَ إِلاّ أَنْت، أَعـوذُ بِكَ مِن شَـرِّ نَفْسـي، وَمِن شَـرِّ الشَّيْـطانِ وَشِـرْكِه، وَأَنْ أَقْتَـرِفَ"
                    "عَلـى نَفْسـي سوءاً أَوْ أَجُـرَّهُ إِلـى مُسْـلِم . "
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
                    "اللّهُـمَّ أَسْـلَمْتُ نَفْـسي إِلَـيْكَ، وَفَوَّضْـتُ أَمْـري إِلَـيْكَ، وَوَجَّـهْتُ وَجْـهي إِلَـيْكَ،\n"
                    "وَأَلْـجَـاْتُ ظَهـري إِلَـيْكَ، رَغْبَـةً وَرَهْـبَةً إِلَـيْكَ، لا مَلْجَـأَ وَلا مَنْـجـا مِنْـكَ إِلاّ إِلَـيْكَ،"
                    "آمَنْـتُ بِكِتـابِكَ الّـذي أَنْزَلْـتَ وَبِنَبِـيِّـكَ الّـذي أَرْسَلْـت. "
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



            ],
          ),
        ),
      ),
      ),
    );
  }
}
