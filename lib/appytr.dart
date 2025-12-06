import 'package:flutter/material.dart';


class Appytr extends StatefulWidget {
  const Appytr({super.key});

  @override
  State<Appytr> createState() => _NasandnState();
}

class _NasandnState extends State<Appytr> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade100,
          title: Center(
            child: Text(
             "ئەپڵیکەیشنەکانمان",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // align to start
            children: [
             
             
               const SizedBox(height: 30),
               const SizedBox(width: 30),
                Card(
                      child:    Row(
                children: [
                  Image.asset(
                    'images/page.jpg',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 8), // little space
                  Text(" ئەپڵیکەیشنی "" : ""True cashier"),
                ],   
              ),   
                ),
                Card(
                  child: Column(
                    children: [
                      Text("کەمێک ڕوونکردنەوە لەسەر ئەپڵیکەیشنی \n"
                      "True cashier\n"
                     "ئەپڵیکەیشنەکەمان تەواو بەشێوەی نوێگەری دروستکراوە کە دەتوانی لەسەر هەموو ئامێرەکانی وەک کۆمپیتەر و تابلێت و موبایل بەکاربهێندرێت و"
                     "سێ شێوازی فڕۆشتن و کڕینی تێدا بەکارهێندراوە(قەرز ، قیست ، کاش)"
                      "دەتواندرێت بەشێوەی ئۆنلاین یان ئۆنفلاین بەکاربهێنیت و"
                      "سێ زمانی جیاوازی تێدا بەکارهێندراوە (ئینگلیزی ، عرەبی ،کوردی)"
                      "\n\n"
                      "بۆ زانیاری زیاتر نامە بنێرە بۆ پەیجەکەمان"
                     ),
                    ],
                  ),
                ),
              

               const SizedBox(height: 16),

            ],
          ),
        ),
      ),
    );
  }
}