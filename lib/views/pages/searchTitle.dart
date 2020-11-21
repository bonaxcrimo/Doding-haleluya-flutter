import 'package:first/dao/dodingDao.dart';
import 'package:first/models/SongModel.dart';
import 'package:first/views/components/textView.dart';
import 'package:flutter/material.dart';

import '../../configuration.dart';

class SearchTitle extends StatefulWidget {
  @override
  _SearchTitleState createState() => _SearchTitleState();
}

class _SearchTitleState extends State<SearchTitle> {
  List<SongModel> _data = new List();
  DodingDao _query = new DodingDao();

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = new TextEditingController();
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "Cari berdasarkan judul",
          style: TextStyle(color: Colors.white),
        )),
        body: Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              OutlineTextView(
                controller: _controller,
                hintText: "Masukkan Huruf Min 3",
                type: TextInputType.number,
                borderColor: colorPrimaryDark,
                customFunction: (val) {
                  _query.getSongByText(val).then((value) => {
                        setState(() {
                          _data = value;
                        })
                      });
                },
              ),
              _data.isEmpty
                  ? Text('')
                  : Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, i) {
                            return _buildRow(_data[i]);
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(height: 1),
                          itemCount: _data.length))
            ],
          ),
        ));
  }

  Widget _buildRow(SongModel lagu) {
    return Card(
      margin: EdgeInsets.all(0),
      color: Colors.transparent,
      elevation: 0.0,
      child: Container(
          child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/song-detail',
                    arguments: lagu.no.toString());
              },
              title: Text(
                '${lagu.no}. ${lagu.judul}',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ))),
    );
  }
}
