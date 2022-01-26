import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PdfScreen extends StatefulWidget {
  final String pdfDriveUrl;
  PdfScreen({@required this.pdfDriveUrl});
  @override
  _PdfScreenState createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  String localFile;
  int currentPage = 0;
  int totalPages = 0;

  @override
  void initState() {
    super.initState();
    ApiService.loadPDF(pdfDrive: widget.pdfDriveUrl).then((value) {
      setState(() {
        localFile = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Locales.currentLocale(context).toString() == "en"
                    ? '$currentPage of $totalPages'
                    : '$currentPage من $totalPages',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontSize: 14, color: Colors.white),
              ),
            )),
        body: localFile != null
            ? SafeArea(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: _height * 0.8,
                        child: PDFView(
                          fitEachPage: true,
                          onPageChanged: (page, total) {
                            setState(() {
                              currentPage = page + 1;
                              totalPages = total;
                            });
                          },
                          filePath: localFile,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()));
  }
}

class ApiService {
  static Future<String> loadPDF({@required String pdfDrive}) async {
    var response = await http.get(Uri.parse(pdfDrive));
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "/data.pdf");
    file.writeAsBytes(response.bodyBytes, flush: true);
    return file.path;
  }
}
