import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class Farmwda extends StatefulWidget {
  const Farmwda({super.key});

  @override
  State<Farmwda> createState() => _FarmwdaState();
}

class _FarmwdaState extends State<Farmwda> {
  String? localPath;
  PDFViewController? pdfViewController;
  int totalPages = 0;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    loadPDF();
  }

  Future<void> loadPDF() async {
    final bytes = await rootBundle.load('assets/pdf/farmwda.pdf');
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/farmwda.pdf");
    await file.writeAsBytes(bytes.buffer.asUint8List(), flush: true);
    setState(() {
      localPath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "فەرموودە",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: localPath == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: PDFView(
                    filePath: localPath!,
                    enableSwipe: true,
                    swipeHorizontal: false,
                    autoSpacing: true,
                    pageFling: false,
                    onRender: (pages) {
                      setState(() {
                        totalPages = pages ?? 0;
                      });
                    },
                    onViewCreated: (controller) {
                      pdfViewController = controller;
                    },
                    onPageChanged: (page, total) {
                      setState(() {
                        currentPage = page ?? 0;
                      });
                    },
                    onError: (error) {
                      debugPrint(error.toString());
                    },
                    onPageError: (page, error) {
                      debugPrint('$page: ${error.toString()}');
                    },
                  ),
                ),
                if (totalPages > 0)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        const Text("Page:"),
                        Expanded(
                          child: Slider(
                            value: (currentPage + 1).toDouble(),
                            min: 1,
                            max: totalPages.toDouble(),
                            divisions: totalPages,
                            label: "${currentPage + 1}",
                            onChanged: (value) {
                              pdfViewController?.setPage(value.toInt() - 1);
                            },
                          ),
                        ),
                        Text("$totalPages"),
                      ],
                    ),
                  ),
              ],
            ),
    );
  }
}
