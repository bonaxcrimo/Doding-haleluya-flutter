import 'package:first/dao/dodingDao.dart';
import 'package:first/models/SongModel.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../../configuration.dart';

class KategoriDetail extends StatefulWidget {
  final String kategoriName;

  KategoriDetail({Key key, this.kategoriName}) : super(key: key);

  @override
  _KategoriDetailState createState() => _KategoriDetailState();
}

class _KategoriDetailState extends State<KategoriDetail> {
  DodingDao _query = new DodingDao();

  @override
  Widget build(BuildContext context) {
    // print(_query.getKategoriSong(widget.kategoriName));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.kategoriName,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List>(
        future: _query.getKategoriSong(widget.kategoriName),
        initialData: List(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? new ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(height: 1),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return _buildRow(snapshot.data[i]);
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Widget _buildRow(SongModel song) {
    return Card(
      margin: EdgeInsets.all(0),
      color: Colors.transparent,
      elevation: 0.0,
      child: Container(
          child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, '/song-detail',
              arguments: song.no.toString());
          // final RenderBox box = context.findRenderObject();
          // Share.share(song.judul,
          //     subject: song.judul,
          //     sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
        },
        title: Text(
          song.no.toString() + '. ' + song.judul,
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 14),
        ),
      )),
    );
  }
}
