import 'package:flutter/material.dart';
import 'package:first/configuration.dart';
import 'package:first/models/GridMenu.dart';
import 'package:first/views/components/gridView.dart';

class HomePage extends StatelessWidget {
  List<GridMenu> gridmenu = [
    GridMenu("Cari dengan nomor", Icons.music_note, greenDark, 'search-number'),
    GridMenu("Cari dengan judul", Icons.music_note, colorPrimaryDark,
        'search-title'),
    GridMenu("Lihat Kategori", Icons.playlist_play, darkblue, 'kategori'),
    GridMenu("Tentang Aplikasi", Icons.info, pink, 'about'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              backgroundColor: kuningColor,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Doding Haleluya",
                      style: TextStyle(
                        color: grayColor,
                        fontSize: 16.0,
                      )),
                  background: Image.asset(
                    'assets/banner_doding.png',
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Container(
          color: lightgray,
          child: MyGridView(gridMenu: gridmenu),
        ),
      ),
    );
  }
}
