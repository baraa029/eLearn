import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_track/models/bookModel.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatelessWidget {
  Book book;
  PdfScreen(this.book);
  PdfViewerController pdfViewerController = PdfViewerController();
  final GlobalKey<SfPdfViewerState> pdfViewerStateKey = GlobalKey();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    return Scaffold(
      body: SfPdfViewer.network(book.pdfurl,
          controller: pdfViewerController, key: pdfViewerStateKey),
      // appBar: AppBar(
      //   actions: <Widget>[
      //     IconButton(
      //         onPressed: () {
      //           pdfViewerStateKey.currentState.openBookmarkView();
      //         },
      //         icon: Icon(
      //           Icons.bookmark,
      //           color: Colors.white,
      //         )),
      //     IconButton(
      //         onPressed: () {
      //           pdfViewerController.jumpToPage(5);
      //         },
      //         icon: Icon(
      //           Icons.arrow_drop_down_circle,
      //           color: Colors.white,
      //         )),
      //     IconButton(
      //         onPressed: () {
      //           pdfViewerController.zoomLevel = 1.25;
      //         },
      //         icon: Icon(
      //           Icons.zoom_in,
      //           color: Colors.white,
      //         ))
      //   ],
      // ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfPdfViewer.network(
          'https://firebasestorage.googleapis.com/v0/b/e-learningtrack.appspot.com/o/book%2FBooksstream_k33_Book141MH.pdf?alt=media&token=7a20cbbb-480a-4595-a2c1-efbfffc76a42',
          controller: _pdfViewerController,
          key: _pdfViewerStateKey),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _pdfViewerStateKey.currentState.openBookmarkView();
              },
              icon: Icon(
                Icons.bookmark,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                _pdfViewerController.jumpToPage(5);
              },
              icon: Icon(
                Icons.arrow_drop_down_circle,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                _pdfViewerController.zoomLevel = 1.25;
              },
              icon: Icon(
                Icons.zoom_in,
                color: Colors.white,
              ))
        ],
      ),
    ));
  }
}
