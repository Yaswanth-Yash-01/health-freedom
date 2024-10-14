import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewerScreen extends StatefulWidget {
  final String pdfPath;

  const PdfViewerScreen({Key? key, required this.pdfPath}) : super(key: key);

  @override
  _PdfViewerScreenState createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  late PdfController pdfController;

  @override
  void initState() {
    super.initState();
    loadPdf();
  }

  Future<void> loadPdf() async {
    try {
      pdfController = PdfController(document: PdfDocument.openAsset(widget.pdfPath));
      setState(() {});
    } catch (e) {
      print("Error loading PDF: $e");
    }
  }

  @override
  void dispose() {
    pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pdfPath.split('/').last),
        backgroundColor: Color(0xFF37966F),
      ),
      body: pdfController != null
          ? PdfView(controller: pdfController)
          : Center(child: CircularProgressIndicator()),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:pdfx/pdfx.dart';

// class PdfViewerScreen extends StatefulWidget {
//   final String pdfPath;

//   const PdfViewerScreen({Key? key, required this.pdfPath}) : super(key: key);

//   @override
//   _PdfViewerScreenState createState() => _PdfViewerScreenState();
// }

// class _PdfViewerScreenState extends State<PdfViewerScreen> {
//   late PdfController pdfController;

//   @override
//   void initState() {
//     super.initState();
//     pdfController = PdfController(document: PdfDocument.openAsset(widget.pdfPath));
//   }

//   @override
//   void dispose() {
//     pdfController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.pdfPath.split('/').last), backgroundColor: Color.fromARGB(255, 84, 147, 86)),
//       body: PdfView(
//         controller: pdfController,
//       ),
//     );
//   }
// }
