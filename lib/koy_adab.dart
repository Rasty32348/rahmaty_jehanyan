import 'package:flutter/material.dart';


// adaby_naxosh
import 'adabakan/adaby_naxosh.dart';

// adaby_haj _w_hamra
import 'adabakan/adaby_hamra.dart';
import 'adabakan/adaby_haj.dart';
import 'adabakan/bastny_ehram.dart';

// adaby_miwan _w_miwandary
import 'adabakan/adaby_miwany.dart';
import 'adabakan/adaby_miwandary.dart';

// qsakrdn_w_nanxwardn
import 'adabakan/adaby_qsakrdn.dart';
import 'adabakan/adaby_nanxwardn.dart';

// mzgawt_w_dwha
import 'adabakan/adaby_mzgawt.dart';
import 'adabakan/adaby_dwha.dart';

// xawtn_w_qwrbany_jazen
import 'adabakan/adaby_xawtn.dart';
import 'adabakan/adaby_qwrbany.dart';
import 'adabakan/adaby_jazen.dart';

// nwej
import 'adabakan/adaby_nwwj.dart';


class KoyAdab extends StatefulWidget {
  const KoyAdab({super.key});

  @override
  State<KoyAdab> createState() => _XwindnawaZikrState();
}

class _XwindnawaZikrState extends State<KoyAdab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("کۆی ئادابەکان",
         style: TextStyle(color: Colors.white),
        ),
         backgroundColor: Colors.purple[200],
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: const Icon(Icons.format_list_numbered_outlined,color: Colors.blueAccent),
            title: const Text("ئادابەکانى سەردانى نەخۆش"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdabyNaxosh()),
          );
            },
          ),

                ListTile(
            leading: const Icon(Icons.format_list_numbered_outlined,color: Colors.blueAccent),
            title: const Text("ئادابەکانى عومرەکردن"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdabyHamra()),
          );
            },
          ),

                  ListTile(
            leading: const Icon(Icons.format_list_numbered_outlined,color: Colors.blueAccent),
            title: const Text("ئادابەکانى حەجکردن"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdabyHaj()),
          );
            },
          ),

            ListTile(
            leading: const Icon(Icons.format_list_numbered_outlined,color: Colors.blueAccent),
            title: const Text("بەستنی ئیحرام بۆ پیاوان لە مەڕاسیمی حەج و عومرە دا"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BastnyEhram()),
          );
            },
          ),

            ListTile(
            leading: const Icon(Icons.format_list_numbered_outlined,color: Colors.blueAccent),
            title: const Text("ئادابی میوان"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdabyMiwany()),
          );
            },
          ),

           ListTile(
            leading: const Icon(Icons.format_list_numbered_outlined,color: Colors.blueAccent),
            title: const Text("ئادابی میوانداری"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdabyMiwandary()),
          );
            },
          ),

            ListTile(
            leading: const Icon(Icons.format_list_numbered_outlined,color: Colors.blueAccent),
            title: const Text("ئادابی قسەکردن"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdabyQsakrdn()),
          );
            },
          ),

           ListTile(
            leading: const Icon(Icons.format_list_numbered_outlined,color: Colors.blueAccent),
            title: const Text("ئادابی نان خواردن"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdabyNanxwardn()),
          );
            },
          ),

              ListTile(
            leading: const Icon(Icons.format_list_numbered_outlined,color: Colors.blueAccent),
            title: const Text("ئادابی مزگەوت"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdabyMzgawt()),
          );
            },
          ),

                ListTile(
            leading: const Icon(Icons.format_list_numbered_outlined,color: Colors.blueAccent),
            title: const Text("ئادابی دوعا"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdabyDwha()),
          );
            },
          ),

                   ListTile(
            leading: const Icon(Icons.format_list_numbered_outlined,color: Colors.blueAccent),
            title: const Text("ئادابی خەوتن"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdabyXawtn()),
          );
            },
          ),

           ListTile(
            leading: const Icon(Icons.format_list_numbered_outlined,color: Colors.blueAccent),
            title: const Text("ئادابی  قوربانی کردن"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdabyQwrbany()),
          );
            },
          ),

           ListTile(
            leading: const Icon(Icons.format_list_numbered_outlined,color: Colors.blueAccent),
            title: const Text("ئادابی ڕۆژی جەژن"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdabyJazen()),
          );
            },
          ),

           ListTile(
            leading: const Icon(Icons.format_list_numbered_outlined,color: Colors.blueAccent),
            title: const Text("ئادابی نوێژ"),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdabyNwwj()),
          );
            },
          ),

                  ],
      ),
    );
  }
}