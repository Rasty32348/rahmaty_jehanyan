import 'package:flutter/material.dart';

class Appytr extends StatefulWidget {
  const Appytr({super.key});

  @override
  State<Appytr> createState() => _AppytrState();
}

class _AppytrState extends State<Appytr> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade400,
          title: const Center(
            child: Text(
              "ئەپڵیکەیشنەکانمان",
              style: TextStyle(color: Colors.white),
            ),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 20),

                /// ------------------ True Cashier ------------------
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/page.jpg',
                          width: 60,
                          height: 60,
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            "ئەپڵیکەیشنی : True Cashier",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Card(
                  elevation: 3,
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "کەمێک ڕوونکردنەوە لەسەر ئەپڵیکەیشنی\n"
                      "True Cashier\n\n"
                      "ئەپڵیکەیشنەکەمان تەواو بەشێوەی نوێگەری دروستکراوە کە دەتوانی لەسەر هەموو ئامێرەکان وەک کۆمپیتەر و تابلێت و موبایل بەکاربهێندرێت.\n"
                      "سێ شێوازی فڕۆشتن و کڕین تێدایە (قەرز، قیست، کاش).\n"
                      "دەتواندرێت بەشێوەی ئۆنلاین یان ئۆفڵاین بەکاربهێنرێت.\n"
                      "سێ زمانی جیاواز تێدایە (ئینگلیزی، عەرەبی، کوردی).\n\n"
                      "بۆ زانیاری زیاتر نامە بنێرە بۆ پەیجەکەمان.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// ------------------ True Tourist ------------------
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/turist.png',
                          width: 60,
                          height: 60,
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            "ئەپڵیکەیشنی : True Tourist",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Card(
                  elevation: 3,
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "کەمێک ڕوونکردنەوە لەسەر ئەپڵیکەیشنی\n"
                      "True Tourist\n\n"
                      "True Tourist باشترین هاوڕێی تۆیە بۆ دۆزینەوەی جوانییەکانی جیهان. چیت دەوێت؟ شوێنێکی گەشتیاری ، هوتێل یان موتێلێکی خۆش، شوێنێکی مێژوویی، یان پارکێکی ئارام؟ ئێمە هەموویمان بۆ کۆکردوویتەتەوە.\n\n"
                      "تایبەتمەندییە سەرەکییەکان:\n"
                      "• نەخشەی زیرەک: دۆزینەوەی شوێنە گەشتیارییەکان لەسەر نەخشە بە وردی.\n"
                      "• زانیاری تەواو: وێنە، ناونیشان و زانیاری پێویست دەربارەی هەر شوێنێک و بەکرێی گرتنی شوێنەکە.\n"
                      "• گەڕانی خێرا: بە ئاسانی ئەو شوێنە بدۆزەرەوە کە بەدوایدا دەگەڕێیت.\n"
                      "• ڕووکارێکی سادە: دیزاینکراوە بۆ ئەوەی بە ئاسانترین شێوە بەکاریبهێنیت.\n\n"
                      "ئێستا True Tourist دابگرە و با گەشتە نوێیەکەت دەست پێ بکات!\n"
                      "هەر ئێستا دایبەزێنە",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}