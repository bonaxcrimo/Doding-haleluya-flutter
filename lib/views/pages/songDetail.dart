import 'package:first/dao/dodingDao.dart';
import 'package:first/models/SongModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:share/share.dart';

import '../../configuration.dart';

class SongDetail extends StatefulWidget {
  final String no;

  SongDetail({Key key, this.no}) : super(key: key);
  @override
  _SongDetailState createState() => _SongDetailState();
}

class _SongDetailState extends State<SongDetail> {
  DodingDao _query = new DodingDao();
  String _judul = "";
  String _kategori = "";
  String _lirik = "";
  String _no = "";
  @override
  Widget build(BuildContext context) {
    var data = _query.getSong(widget.no);
    // data.then((value) => {
    //       setState(() {
    //         _no = widget.no;
    //         _judul = '${widget.no}. ${value.judul}';
    //         _kategori = '(${value.kategori})';
    //         _lirik = value.lirik;
    //       })
    //     });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lirik Lagu",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final RenderBox box = context.findRenderObject();
          Share.share(_lirik.replaceAll('<br>', '\n'),
              subject: '$_no. $_judul',
              sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
        },
        child: Icon(Icons.share),
        backgroundColor: colorPrimaryDark,
      ),
      body: FutureBuilder<SongModel>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('Loading Data...'));
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else {
              return SingleChildScrollView(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: [
                      Text(
                        '${widget.no}.' + snapshot.data.judul,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Html(data: snapshot.data.lirik)
                    ],
                  ));
            }
          }
        },
      ),
    );
  }
}
