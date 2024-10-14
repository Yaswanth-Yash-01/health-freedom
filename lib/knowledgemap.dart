import 'package:flutter/material.dart';
import 'PdfViewerScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class Knowledgemap extends StatelessWidget {


  
   final List<String> pdfFiles;  // List of PDF file paths
  final String url;  // Associated URL

  Knowledgemap({required this.pdfFiles, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF List'),
        backgroundColor: Color(0xFF37966F),
      ),
      body: ListView.builder(
        itemCount: pdfFiles.length,
        itemBuilder: (context, index) {
          String fileName = pdfFiles[index].split('/').last;

          return Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 12),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(222, 255, 214, 160), 
                borderRadius: BorderRadius.circular(4.0), 
              ),
              child: ListTile(
                title: Text(fileName), 
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PdfViewerScreen(pdfPath: pdfFiles[index]),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF37966F),
        onPressed: () async {
          if (await canLaunch(url)) {
            await launch(url);  // Open the URL
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Icon(Icons.link),
      ),
    );
  }
}
