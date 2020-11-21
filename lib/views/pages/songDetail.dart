import 'package:first/dao/dodingDao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
  String _lirik = "";
  String _no = "";
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data = _query.getSong(widget.no);
    data.then((value) => {
          setState(() {
            _no = widget.no;
            _judul = '${widget.no}. ${value.judul}';
            _lirik = value.lirik;
          })
        });
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
      body: _judul == ""
          ? Center(child: Text('Loading Data...'))
          : SingleChildScrollView(
              padding: EdgeInsets.only(top: 15.0),
              child: Column(
                children: [
                  Text(
                    '${widget.no}.' + _judul,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Html(data: _lirik)
                ],
              )),
    );
  }
}
