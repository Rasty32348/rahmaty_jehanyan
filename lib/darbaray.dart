import 'package:flutter/material.dart';


class nasandn extends StatefulWidget {
  const nasandn({super.key});

  @override
  State<nasandn> createState() => _NasandnState();
}

class _NasandnState extends State<nasandn> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade100,
          title: Center(
            child: Text(
             "دەربارەی پڕۆگرامەر",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Card(child:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // align to start
            children: [
             
              const SizedBox(height: 16),
              Text("کۆمپانیای دروستکەر :" + " True technology"),

               const SizedBox(height: 30),
               const SizedBox(width: 30),
                    Card(
                      child:    Row(
                children: [
                  Image.asset(
                    'images/page.jpg',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 8), // little space
                  Text(" پەیجی فەیسبووک "": ""True technology"),
                ],   
              ),   
                ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}