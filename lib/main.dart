import 'dart:async';
import 'package:flutter/material.dart';
import 'gwgirtnjyanama/gwigtin.dart';
import 'darbaray.dart';
import 'zikrakanman/xwindndwaw.dart';
import 'appytr.dart';
import 'azmwn/koyazmon.dart';
import 'koy_adab.dart';
import 'farmwda/farmwda.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "اقرا",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  // rotating messages
  final List<String> _messages = [
    "الحمد لله",
    "سبحان الله",
    "الله أكبر",
    "أستغفر الله",
    "لا حول ولا قوة إلا بالله العلي العظيم",
    "سبحان الله وبحمده",
    "سبحان الله العظيم",
    "اللهم صلِّ على محمد وعلى آل محمد",
    "لا اله الا الله",
    "الحمد لله رب العالمين",
    "لا اله الا سبحانك اني كنت من الظالمين",
  ];
  int _currentMessageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        _currentMessageIndex =
            (_currentMessageIndex + 1) % _messages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: const IconThemeData(
    color: Colors.black, // <-- this makes the drawer icon white
  ),
        title: Text(
          _messages[_currentMessageIndex],
          style: const TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          
        ),
        
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/basheysarawa.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
  endDrawer: Drawer(
  backgroundColor: Colors.white, // set drawer color to white
  child: ListView(
    padding: EdgeInsets.zero,
    children: [

          ListTile(
        title: Text(""),
      
      ),

      const SizedBox(height: 15),
      ListTile(
        leading: const Icon(Icons.account_box_outlined,color: Colors.deepOrange),
        title: Text("دەربارەی"),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const nasandn()),
          );
        },
      ),

           ListTile(
        leading: const Icon(Icons.add_shopping_cart,color: Colors.cyanAccent),
        title: Text("ئەپڵیکەیشنەکانی ترمان"),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Appytr()),
          );
        },
      ),

    ],
  ),
),

      body: Column(
        children: const [
          SizedBox(height: 40),
          Center(
            child: Text(
              "سەرەتا",
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: MainSectionPage(),
          ),
        ],
      ),
    );
  }
}

// Main Section Page
class MainSectionPage extends StatelessWidget {
  const MainSectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.9,
        ),
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const gwigrtnjyanama()),
              );
            },
            child: Card(
              elevation: 4,
              child: SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/sarwarman.png', height: 60),
                    const SizedBox(height: 6),
                    const Center(
                      child: Text(
                        "ژیان نامەی سەروەرمان(د.خ)",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const xwindnawazikr()),
              );
            },
            child: Card(
              elevation: 4,
              child: SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/arabic.png', height: 60),
                    const SizedBox(height: 6),
                    const Center(
                      child: Text(
                        "کۆی زیکرەکان",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

           InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Koyazmon()),
              );
            },
            child: Card(
              elevation: 4,
              child: SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/islamic.png', height: 60),
                    const SizedBox(height: 6),
                    const Center(
                      child: Text(
                        "ئەزموونی نزیک بوونەوە لە مردن",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          

           InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const KoyAdab()),
              );
            },
            child: Card(
              elevation: 4,
              child: SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/adab.png', height: 60),
                    const SizedBox(height: 6),
                    const Center(
                      child: Text(
                        "ئادابەکان",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

           InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Farmwda()),
              );
            },
            child: Card(
              elevation: 4,
              child: SizedBox(
                height: 150,                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/quran.png', height: 60),
                    const SizedBox(height: 6),
                    const Center(
                      child: Text(
                        "فەرموودە هاوبەشەکانی بوخاری و موسلیم",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
