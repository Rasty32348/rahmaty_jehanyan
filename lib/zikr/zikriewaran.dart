import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Zikriewaran extends StatefulWidget {
  const Zikriewaran({super.key});

  @override
  State<Zikriewaran> createState() => _ZikribayanayState();
}

class _ZikribayanayState extends State<Zikriewaran> {
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
      await _player.play(AssetSource("sounds/ewara.mp3"));
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
              "زیکری ئێواران",
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
                    "أَمْسَيْـنا وَأَمْسـى المـلكُ لله وَالحَمدُ لله ، لا إلهَ إلاّ اللّهُ وَحدَهُ لا شَريكَ لهُ، لهُ المُـلكُ ولهُ\n"
                    "الحَمْـد، وهُوَ على كلّ شَيءٍ قدير ، رَبِّ أسْـأَلُـكَ خَـيرَ ما في هـذهِ اللَّـيْلَةِ وَخَـيرَ ما بَعْـدَهـا ،"
                    "وَأَعـوذُ بِكَ مِنْ شَـرِّ ما في هـذا اليوم وَشَرِّ ما بَعْـدَه، رَبِّ أَعـوذُبِكَ مِنَ الْكَسَـلِ وَسـوءِ"
                    "الْكِـبَر ، رَبِّ أَعـوذُ بِكَ مِنْ عَـذابٍ في النّـارِ وَعَـذابٍ في القَـبْر."
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
                    "اللّهُـمَّ بِكَ أَمْسَـينا وَبِكَ أَصْـبَحْنا، وَبِكَ نَحْـيا وَبِكَ نَمُـوتُ وَإِلَـيْكَ الْمَصِيرُ.\n"
                   
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
                    "اللّهـمَّ أَنْتَ رَبِّـي لا إلهَ إلاّ أَنْتَ ، خَلَقْتَنـي وَأَنا عَبْـدُك ، وَأَنا عَلـى عَهْـدِكَ وَوَعْـدِكَ ما\n"
                    "اسْتَـطَعْـت ، أَعـوذُبِكَ مِنْ شَـرِّ ما صَنَـعْت ، أَبـوءُ لَـكَ بِنِعْـمَتِـكَ عَلَـيَّ وَأَبـوءُ بِذَنْـبي"
                    "فَاغْفـِرْ لي فَإِنَّـهُ لا يَغْـفِرُ الذُّنـوبَ إِلاّ أَنْتَ . "
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
                    "اللّهُـمَّ إِنِّـي أَمسيتُ أُشْـهِدُك ، وَأُشْـهِدُ حَمَلَـةَ عَـرْشِـك ، وَمَلَائِكَتَكَ ، وَجَمـيعَ خَلْـقِك ،\n"
                    "أَنَّـكَ أَنْـتَ اللهُ لا إلهَ إلاّ أَنْـتَ وَحْـدَكَ لا شَريكَ لَـك ، وَأَنَّ ُ مُحَمّـداً عَبْـدُكَ وَرَسـولُـك."
                    "\n"
                    "چوار جار (٤ جار)",
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
                    "اللّهُـمَّ ما أَمسى بي مِـنْ نِعْـمَةٍ أَو بِأَحَـدٍ مِـنْ خَلْـقِك ، فَمِـنْكَ وَحْـدَكَ لا شريكَ لَـك ،\n"
                    "فَلَـكَ الْحَمْـدُ وَلَـكَ الشُّكْـر."
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
                    "اللّهُـمَّ عافِـني في بَدَنـي ، اللّهُـمَّ عافِـني في سَمْـعي ، اللّهُـمَّ عافِـني في بَصَـري ، لا إلهَ إلاّ أَنْـتَ. \n"
                    "اللّهُـمَّ إِنّـي أَعـوذُ بِكَ مِنَ الْكُـفر ، وَالفَـقْر ، وَأَعـوذُ بِكَ مِنْ عَذابِ القَـبْر ، لا إلهَ إلاّ أَنْـتَ."
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
                    "حَسْبِـيَ اللّهُ لا إلهَ إلاّ هُوَ عَلَـيهِ تَوَكَّـلتُ وَهُوَ رَبُّ العَرْشِ العَظـيم. \n"
                    
                    "\n"
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
                    "اللّهُـمَّ إِنِّـي أسْـأَلُـكَ العَـفْوَ وَالعـافِـيةَ في الدُّنْـيا وَالآخِـرَة ، اللّهُـمَّ إِنِّـي أسْـأَلُـكَ العَـفْوَ\n"
                    "وَالعـافِـيةَ في ديني وَدُنْـيايَ وَأهْـلي وَمالـي ، اللّهُـمَّ اسْتُـرْ عـوْراتي وَآمِـنْ رَوْعاتـي ، اللّهُـمَّ"
                    "احْفَظْـني مِن بَـينِ يَدَيَّ وَمِن خَلْفـي وَعَن يَمـيني وَعَن شِمـالي ، وَمِن فَوْقـي ، وَأَعـوذُ"
                    "بِعَظَمَـتِكَ أَن أُغْـتالَ مِن تَحْتـي. "
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
                    "اللّهُـمَّ عالِـمَ الغَـيْبِ وَالشّـهادَةِ فاطِـرَ السّماواتِ وَالأرْضِ رَبَّ كـلِّ شَـيءٍ وَمَليـكَه ،\n"
                    "أَشْهَـدُ أَنْ لا إِلـهَ إِلاّ أَنْت ، أَعـوذُ بِكَ مِن شَـرِّ نَفْسـي وَمِن شَـرِّ الشَّيْـطانِ وَشِرْكِهِ ، وَأَنْ"
                    "أَقْتَـرِفَ عَلـى نَفْسـي سوءاً أَوْ أَجُـرَّهُ إِلـى مُسْـلِم. "
                    
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
                    "بِسـمِ اللهِ الذي لا يَضُـرُّ مَعَ اسمِـهِ شَيءٌ في الأرْضِ وَلا في السّمـاءِ وَهـوَ السّمـيعُ العَلـيم.\n"
                    
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
                    "رَضيـتُ بِاللهِ رَبَّـاً وَبِالإسْلامِ ديـناً وَبِمُحَـمَّدٍ صلى الله عليه وسلم نَبِيّـاً.\n"
                    
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
                    "يَا حَيُّ يَا قيُّومُ بِرَحْمَتِكَ أسْتَغِيثُ أصْلِحْ لِي شَأنِي كُلَّهُ وَلاَ تَكِلْنِي إلَى نَفْسِي طَـرْفَةَ عَيْنٍ.\n"
                    
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
                    "يَا حَيُّ يَا قيُّومُ بِرَحْمَتِكَ أسْتَغِيثُ أصْلِحْ لِي شَأنِي كُلَّهُ وَلاَ تَكِلْنِي إلَى نَفْسِي طَـرْفَةَ عَيْنٍ.\n"
                    
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
                    "أَمْسَيْنا وَأَمْسَى الْمُلْكُ للهِ رَبِّ الْعَالَمَيْنِ، اللَّهُمَّ إِنَّي أسْأَلُكَ خَيْرَ هَذَه اللَّيْلَةِ فَتْحَهَا ونَصْرَهَا،\n"
                    "ونُوْرَهَا وبَرَكَتهَا، وَهُدَاهَا، وَأَعُوذُ بِكَ مِنْ شَرِّ مَا فيهِا وَشَرَّ مَا بَعْدَهَا."
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
                    "أَمْسَيْنَا عَلَى فِطْرَةِ الإسْلاَمِ، وَعَلَى كَلِمَةِ الإِخْلاَصِ، وَعَلَى دِينِ نَبِيِّنَا مُحَمَّدٍ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ،\n"
                    "وَعَلَى مِلَّةِ أَبِينَا إبْرَاهِيمَ حَنِيفاً مُسْلِماً وَمَا كَانَ مِنَ المُشْرِكِينَ. "
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
                    "سُبْحـانَ اللهِ وَبِحَمْـدِهِ. \n"
                    
                    "\n"
                    "سەد جار (١٠٠ جار)",
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
                    "لَا إلَه إلّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءِ قَدِيرِ. \n"
                    
                    "\n"
                    "سەد جار (١٠٠ جار)",
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
                    "سُبْحـانَ اللهِ وَبِحَمْـدِهِ عَدَدَ خَلْـقِه ، وَرِضـا نَفْسِـه ، وَزِنَـةَ عَـرْشِـه ، وَمِـدادَ كَلِمـاتِـه.\n"
                    
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
                    "اللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا، وَرِزْقًا طَيِّبًا، وَعَمَلًا مُتَقَبَّلًا.\n"
                    
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
                    "أسْتَغْفِرُ اللهَ وَأتُوبُ إلَيْهِ\n"
                    
                    "\n"
                    "سەد جار (١٠٠ جار)",
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
                    "اللَّهُمَّ صَلِّ وَسَلِّمْ وَبَارِكْ على نَبِيِّنَا مُحمَّد.\n"
                    
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
                    "أَعـوذُ بِكَلِمـاتِ اللّهِ التّـامّـاتِ مِنْ شَـرِّ ما خَلَـق.\n"
                    
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
                    "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ الْهَمِّ وَالْحَزَنِ، وَأَعُوذُ بِكَ مِنْ الْعَجْزِ وَالْكَسَلِ، وَأَعُوذُ بِكَ مِنْ الْجُبْنِ\n"
                    "وَالْبُخْلِ، وَأَعُوذُ بِكَ مِنْ غَلَبَةِ الدَّيْنِ، وَقَهْرِ الرِّجَالِ. "
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
                    "أسْتَغْفِرُ اللهَ العَظِيمَ الَّذِي لاَ إلَهَ إلاَّ هُوَ، الحَيُّ القَيُّومُ، وَأتُوبُ إلَيهِ.\n"
                    
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
                    "أسْتَغْفِرُ اللهَ العَظِيمَ الَّذِي لاَ إلَهَ إلاَّ هُوَ، الحَيُّ القَيُّومُ، وَأتُوبُ إلَيهِ.\n"
                    
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
                    "يَا رَبِّ , لَكَ الْحَمْدُ كَمَا يَنْبَغِي لِجَلَالِ وَجْهِكَ , وَلِعَظِيمِ سُلْطَانِكَ.\n"
                    
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
                    "اللَّهُمَّ إِنَّا نَعُوذُ بِكَ مِنْ أَنْ نُشْرِكَ بِكَ شَيْئًا نَعْلَمُهُ ، وَنَسْتَغْفِرُكَ لِمَا لَا نَعْلَمُهُ. \n"
                    
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
                    "اللّهُـمَّ ما أَمْسَيْنا بي مِـنْ نِعْـمَةٍ أَو بِأَحَـدٍ مِـنْ خَلْـقِك ، فَمِـنْكَ وَحْـدَكَ لا شريكَ لَـك ،\n"
                    "فَلَـكَ الْحَمْـدُ وَلَـكَ الشُّكْـر. "
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
