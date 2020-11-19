import 'package:flutter/material.dart';

class SearchTitle extends StatefulWidget {
  @override
  _SearchTitleState createState() => _SearchTitleState();
}

class _SearchTitleState extends State<SearchTitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        "Cari berdasarkan judul",
        style: TextStyle(color: Colors.white),
      ),
    ));
  }
}
