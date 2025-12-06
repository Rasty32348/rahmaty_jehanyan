import 'package:flutter/material.dart';


//bayany w iwara 
import 'package:rahmaty_jehanyan/zikr/zikribayanay.dart';
import 'package:rahmaty_jehanyan/zikr/zikriewaran.dart';

// xawten w dway nwej
import 'package:rahmaty_jehanyan/zikr/zikridwaynwej.dart';
import 'package:rahmaty_jehanyan/zikr/zikrixawten.dart';
import 'package:rahmaty_jehanyan/zikr/zikrihatanlaxaw.dart';

// nwej w mzgawet

import 'package:rahmaty_jehanyan/zikr/zikridwybang.dart';
import 'package:rahmaty_jehanyan/zikr/Zikrimzgawt.dart';
import 'package:rahmaty_jehanyan/zikr/Zikridastnwej.dart';

// mal w wc w xwardn

import 'package:rahmaty_jehanyan/zikr/Zikrimal.dart';
import 'package:rahmaty_jehanyan/zikr/Zikriwc.dart';
import 'package:rahmaty_jehanyan/zikr/Zikrixwardn.dart';


class xwindnawazikr extends StatefulWidget {
  const xwindnawazikr({super.key});

  @override
  State<xwindnawazikr> createState() => _XwindnawaZikrState();
}

class _XwindnawaZikrState extends State<xwindnawazikr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ئەذکار",
         style: TextStyle(color: Colors.white),
        ),
         backgroundColor: Colors.purple[200],
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: const Icon(Icons.sunny,color: Colors.yellow),
            title: const Text("زیکری بەیانیان"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Zikribayanay()),
          );
            },
          ),

            ListTile(
            leading: const Icon(Icons.sunny_snowing,color: Color.fromARGB(255, 21, 93, 129)),
            title: const Text("زیکری ئێواران"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Zikriewaran()),
          );
            },
          ),

                      ListTile(
            leading: const Icon(Icons.access_alarm,color: Colors.orange),
            title: const Text("زیکری دوای نوێژ"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Zikridwaynwej()),
          );
            },
          ),

                      ListTile(
            leading: const Icon(Icons.airline_seat_individual_suite_sharp,color: Color.fromARGB(255, 108, 128, 238)),
            title: const Text("زیکری خەوتن"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Zikrixawten()),
          );
            },
          ),

                     ListTile(
            leading: const Icon(Icons.night_shelter_sharp,color: Color.fromARGB(255, 224, 210, 84)),
            title: const Text("زیکری هەڵسان لە خەو"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Zikrihatanlaxaw()),
          );
            },
          ),

                     ListTile(
            leading: const Icon(Icons.spatial_audio_off,color: Color.fromARGB(255, 106, 126, 137)),
            title: const Text("زیکری دوای بانگ"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const zikridwybang()),
          );
            },
          ),


        
                     ListTile(
            leading: const Icon(Icons.mosque,color: Color.fromARGB(255, 225, 176, 159)),
            title: const Text("زیکری مزگەوت"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Zikrimzgawt()),
          );
            },
          ),

                               ListTile(
            leading: const Icon(Icons.water_drop,color: Colors.blue),
            title: const Text("زیکری دەستنوێژ"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Zikridastnwej()),
          );
            },
          ),

                                   ListTile(
            leading: const Icon(Icons.house,color: Colors.lightGreen),
            title: const Text("زیکری چوونە دەرەوە و هاتنەوە ماڵ"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Zikrimal()),
          );
            },
          ),

                                      ListTile(
            leading: const Icon(Icons.wc,color: Colors.deepPurpleAccent),
            title: const Text("زیکری سەرئاو"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Zikriwc()),
          );
            },
          ),

                                         ListTile(
            leading: const Icon(Icons.food_bank,color: Colors.red),
            title: const Text("زیکری خواردن و خواردنەوە"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Zikrixwardn()),
          );
            },
          ),


        ],
      ),
    );
  }
}
