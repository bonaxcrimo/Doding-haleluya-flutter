import 'package:first/dao/dodingDao.dart';
import 'package:flutter/material.dart';
import 'package:first/models/KategoriModel.dart';

import '../../configuration.dart';

class Kategori extends StatefulWidget {
  Kategori({Key key}) : super(key: key);

  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  DodingDao _query = new DodingDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Kategori",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List>(
        future: _query.getAllKategori(),
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

  Widget _buildRow(KategoriModel kategori) {
    return Card(
      margin: EdgeInsets.all(0),
      color: Colors.transparent,
      elevation: 0.0,
      child: Container(
          child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, '/kategori-detail',
              arguments: kategori.name);
        },
        title: Text(
          kategori.name,
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 14),
        ),
        trailing: badge(kategori.jumlah),
      )),
    );
  }

  Widget badge(int jumlah) {
    return Container(
      height: 22.0,
      width: 22.0,
      decoration: BoxDecoration(color: grayColor, shape: BoxShape.circle),
      child: Center(
        child: Text(
          jumlah.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
